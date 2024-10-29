Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEF1D5B840
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 01:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858F410E24B;
	Tue, 29 Oct 2024 01:39:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FFC10E24B;
 Tue, 29 Oct 2024 01:39:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6015064542037353910=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5Bv1=2C1/?=
 =?utf-8?q?1=5D_drm/xe/guc=3A_Fix_missing_init_value_and_add_register_order_?=
 =?utf-8?q?check_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 01:39:18 -0000
Message-ID: <173016595858.1357558.5851022574942612587@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023192307.746525-1-zhanjun.dong@intel.com>
In-Reply-To: <20241023192307.746525-1-zhanjun.dong@intel.com>
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

--===============6015064542037353910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v1,1/1] drm/xe/guc: Fix missing init value and add register order check (rev2)
URL   : https://patchwork.freedesktop.org/series/140392/
State : failure

== Summary ==

CI Bug Log - changes from xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154_full -> xe-pw-140392v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140392v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140392v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140392v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +10 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-sliding-128x128:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +5 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-128x128.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-128x128.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [PASS][9] -> [FAIL][10] +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-lnl:          [PASS][11] -> [FAIL][12] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][13] ([Intel XE#2327]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][15] ([Intel XE#1124]) -> [SKIP][16] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][17] ([Intel XE#2887]) -> [SKIP][18] +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][19] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][21] ([Intel XE#2333]) -> [SKIP][22] +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][23] ([Intel XE#2311]) -> [SKIP][24] +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][25] ([Intel XE#2350]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][27] ([Intel XE#2313]) -> [SKIP][28] +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][29] ([Intel XE#2934]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][31] ([Intel XE#870]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][33] ([Intel XE#1489]) -> [SKIP][34] +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          [SKIP][35] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][36] +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_psr@pr-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_psr@pr-suspend.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [SKIP][37] ([Intel XE#1130]) -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  
Known issues
------------

  Here are the changes found in xe-pw-140392v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#1701]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2890]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][43] -> [FAIL][44] ([Intel XE#1231] / [Intel XE#1242])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1124])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2191])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2887])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#787]) +13 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1195] / [Intel XE#1727] / [Intel XE#2692])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#1195] / [Intel XE#2692])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#373])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1424])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2423]) +54 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([i915#3804])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#2882])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-hdmi-a3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][62] ([Intel XE#301]) +2 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][63] -> [FAIL][64] ([Intel XE#301])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#301]) +8 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#886]) +7 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2293]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][69] -> [FAIL][70] ([Intel XE#1874]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#651]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#656]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#653]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][74] -> [FAIL][75] ([Intel XE#616]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][76] -> [FAIL][77] ([Intel XE#361])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-adlp:         [PASS][78] -> [DMESG-WARN][79] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-warn
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2763]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#870])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2446]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_pm_rpm@cursor.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#3184])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1489]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#2808]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@pr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#327]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][91] -> [FAIL][92] ([Intel XE#2883]) +6 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][93] -> [FAIL][94] ([Intel XE#771] / [Intel XE#899])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][95] -> [FAIL][96] ([Intel XE#899])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2905])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#688]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#1130]) +121 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#2754])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-7/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#3160])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2905]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#2229])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2229])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2229])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2541])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2284])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][112] -> [ABORT][113] ([Intel XE#1358] / [Intel XE#1607])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][114] -> [ABORT][115] ([Intel XE#1607] / [Intel XE#1794])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#958])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#944])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - shard-adlp:         [PASS][119] -> [TIMEOUT][120] ([Intel XE#1033] / [Intel XE#1727]) +3 other tests timeout
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [SKIP][121] ([Intel XE#1885]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][123] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][125] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][127] ([Intel XE#3194]) -> [PASS][128] +2 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][129] ([Intel XE#1426]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][131] -> [PASS][132] +6 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][133] ([Intel XE#2890]) -> [PASS][134] +7 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [ABORT][135] ([Intel XE#2388]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][137] -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][139] ([Intel XE#877]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [FAIL][141] ([Intel XE#2882]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][143] -> [PASS][144] +13 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][145] ([Intel XE#886]) -> [PASS][146] +8 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][147] ([Intel XE#2423]) -> [PASS][148] +60 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip@flip-vs-panning-vs-hang.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-adlp:         [DMESG-WARN][149] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#455]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][153] ([Intel XE#361]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][155] ([Intel XE#1430]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
    - shard-lnl:          [DMESG-WARN][157] ([Intel XE#3184]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][159] ([Intel XE#2446]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-lnl:          [FAIL][161] ([Intel XE#2948]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][163] ([Intel XE#899]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][165] ([Intel XE#1600]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][167] ([Intel XE#1473]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - shard-bmg:          [DMESG-WARN][169] -> [PASS][170] +8 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-8/igt@xe_exec_balancer@many-cm-parallel-basic.html
    - shard-adlp:         [DMESG-WARN][171] -> [PASS][172] +5 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-1/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_basic@many-null:
    - shard-adlp:         [TIMEOUT][173] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_basic@many-null.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@xe_exec_basic@many-null.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-lnl:          [FAIL][175] -> [PASS][176] +2 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-lnl:          [DMESG-WARN][177] ([Intel XE#3230]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr:
    - shard-dg2-set2:     [DMESG-WARN][179] -> [PASS][180] +6 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-userptr.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-adlp:         [DMESG-WARN][181] ([Intel XE#358]) -> [PASS][182] +6 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - shard-dg2-set2:     [DMESG-WARN][183] ([Intel XE#358]) -> [PASS][184] +6 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-434/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - shard-lnl:          [DMESG-WARN][185] -> [PASS][186] +12 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-adlp:         [DMESG-WARN][187] ([Intel XE#3230]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-4/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - shard-dg2-set2:     [DMESG-WARN][189] ([Intel XE#3230]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-435/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [SKIP][191] ([Intel XE#1192]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@xe_live_ktest@xe_dma_buf.html
    - shard-bmg:          [SKIP][193] ([Intel XE#1192]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1192]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
    - shard-lnl:          [SKIP][197] ([Intel XE#1192]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [SKIP][199] ([Intel XE#2229]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][201] ([Intel XE#569]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-2/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][203] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_pm@s4-basic.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_pm@s4-basic.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [SKIP][205] ([Intel XE#1130]) -> [PASS][206] +123 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_spin_batch@spin-all.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@xe_spin_batch@spin-all.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [FAIL][207] ([Intel XE#1081]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][209] ([Intel XE#2423]) -> [SKIP][210] ([Intel XE#873])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][211] ([Intel XE#2423]) -> [SKIP][212] ([Intel XE#2370])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][213] ([Intel XE#2327]) -> [SKIP][214] ([Intel XE#2890])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][215] ([Intel XE#2890]) -> [SKIP][216] ([Intel XE#2327])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          [SKIP][217] -> [SKIP][218] ([Intel XE#2327])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-lnl:          [DMESG-FAIL][219] ([Intel XE#1725]) -> [DMESG-WARN][220] ([Intel XE#1725])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][221] ([Intel XE#2890]) -> [SKIP][222] ([Intel XE#1124]) +5 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][223] -> [SKIP][224] ([Intel XE#610])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][225] ([Intel XE#1124]) -> [SKIP][226] ([Intel XE#2890]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][227] ([Intel XE#3194]) -> [FAIL][228] ([Intel XE#1231] / [Intel XE#1242]) +1 other test fail
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][229] ([Intel XE#2890]) -> [SKIP][230] ([Intel XE#607])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][231] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][232] ([Intel XE#2423]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][233] ([Intel XE#367]) -> [SKIP][234] ([Intel XE#2423])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][235] ([Intel XE#2423]) -> [SKIP][236] ([Intel XE#367]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][237] ([Intel XE#2890]) -> [SKIP][238] ([Intel XE#2887]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][239] ([Intel XE#2887]) -> [SKIP][240] ([Intel XE#2890]) +8 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-bmg:          [SKIP][241] -> [SKIP][242] ([Intel XE#2887]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][243] ([Intel XE#2724]) -> [SKIP][244] ([Intel XE#2890])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          [SKIP][245] ([Intel XE#2423]) -> [SKIP][246] ([Intel XE#2325]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          [SKIP][247] ([Intel XE#2252]) -> [SKIP][248] ([Intel XE#2423]) +6 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][249] ([Intel XE#2423]) -> [SKIP][250] ([Intel XE#2252]) +7 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][251] ([Intel XE#2423]) -> [SKIP][252] ([Intel XE#2341])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_content_protection@content-type-change.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][253] ([Intel XE#1188]) -> [SKIP][254] ([Intel XE#2423])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_content_protection@uevent.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][255] ([Intel XE#2320]) -> [SKIP][256] ([Intel XE#2423]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][257] ([Intel XE#2423]) -> [SKIP][258] ([Intel XE#2320]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][259] ([Intel XE#2423]) -> [SKIP][260] ([Intel XE#2321]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][261] ([Intel XE#2321]) -> [SKIP][262] ([Intel XE#2423])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-adlp:         [SKIP][263] ([Intel XE#309]) -> [TIMEOUT][264] ([Intel XE#1033] / [Intel XE#1727])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][265] ([Intel XE#2423]) -> [SKIP][266] ([Intel XE#2323])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][267] ([Intel XE#2244]) -> [SKIP][268] ([Intel XE#2890])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_dsc@dsc-basic.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][269] ([Intel XE#2890]) -> [SKIP][270] ([Intel XE#2244])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][271] ([Intel XE#2423]) -> [FAIL][272] ([Intel XE#301])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][273] ([Intel XE#1504]) -> [TIMEOUT][274] ([Intel XE#1504]) +1 other test timeout
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][275] ([Intel XE#301]) -> [SKIP][276] ([Intel XE#2423])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][277] -> [SKIP][278] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][279] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][280] ([Intel XE#2890]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][281] ([Intel XE#2890]) -> [SKIP][282] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [SKIP][283] ([Intel XE#651]) -> [TIMEOUT][284] ([Intel XE#1033] / [Intel XE#1727])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][285] ([Intel XE#2311]) -> [SKIP][286] ([Intel XE#2890]) +12 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][287] ([Intel XE#2890]) -> [SKIP][288] ([Intel XE#2311]) +16 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][289] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][290] ([Intel XE#1861])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][291] ([Intel XE#2890]) -> [FAIL][292] ([Intel XE#2333]) +7 other tests fail
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][293] -> [FAIL][294] ([Intel XE#2333]) +2 other tests fail
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][295] ([Intel XE#2333]) -> [SKIP][296] ([Intel XE#2890]) +9 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         [FAIL][297] ([Intel XE#1861]) -> [TIMEOUT][298] ([Intel XE#1033] / [Intel XE#1727]) +1 other test timeout
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][299] -> [SKIP][300] ([Intel XE#2352])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][301] -> [SKIP][302] ([Intel XE#2311]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][303] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][304] ([Intel XE#656])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][305] ([Intel XE#2313]) -> [SKIP][306] ([Intel XE#2890]) +14 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][307] ([Intel XE#2352]) -> [SKIP][308] ([Intel XE#2890])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][309] ([Intel XE#2890]) -> [SKIP][310] ([Intel XE#2313]) +8 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][311] -> [SKIP][312] ([Intel XE#2313]) +11 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-rte:
    - shard-adlp:         [SKIP][313] ([Intel XE#656]) -> [TIMEOUT][314] ([Intel XE#1033] / [Intel XE#1727])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-rte.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-adlp:         [SKIP][315] ([Intel XE#653]) -> [TIMEOUT][316] ([Intel XE#1033] / [Intel XE#1727])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][317] -> [SKIP][318] ([Intel XE#2934])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][319] -> [SKIP][320] ([Intel XE#2927])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][321] ([Intel XE#2501]) -> [SKIP][322] ([Intel XE#2423])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][323] ([Intel XE#2423]) -> [SKIP][324] ([Intel XE#2486])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-bmg:          [SKIP][325] ([Intel XE#2763]) -> [SKIP][326] ([Intel XE#2423])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][327] ([Intel XE#2423]) -> [SKIP][328] ([Intel XE#2763]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][329] ([Intel XE#870]) -> [SKIP][330] ([Intel XE#2890])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][331] -> [SKIP][332] ([Intel XE#2505])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][333] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][334] ([Intel XE#2446])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][335] ([Intel XE#2446]) -> [SKIP][336] ([Intel XE#1439] / [Intel XE#3141])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][337] -> [SKIP][338] ([Intel XE#1489]) +5 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][339] ([Intel XE#2890]) -> [SKIP][340] ([Intel XE#2387])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][341] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][342] ([Intel XE#2890]) +6 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][343] ([Intel XE#2890]) -> [SKIP][344] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][345] ([Intel XE#2329]) -> [SKIP][346] ([Intel XE#2423]) +3 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][347] ([Intel XE#2423]) -> [SKIP][348] ([Intel XE#2330]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][349] ([Intel XE#2423]) -> [SKIP][350] ([Intel XE#2413])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][351] ([Intel XE#2423]) -> [FAIL][352] ([Intel XE#1729])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#362]) -> [SKIP][354] ([Intel XE#1500])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          [SKIP][355] ([Intel XE#1499]) -> [SKIP][356] ([Intel XE#2423])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_vrr@flip-basic-fastset.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][357] ([Intel XE#2423]) -> [SKIP][358] ([Intel XE#1499]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][359] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][360] ([Intel XE#2423])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          [SKIP][361] ([Intel XE#2905]) -> [SKIP][362] ([Intel XE#1130]) +7 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-discovery.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          [SKIP][363] ([Intel XE#1130]) -> [SKIP][364] ([Intel XE#2905]) +8 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [SKIP][365] ([Intel XE#1130]) -> [FAIL][366] ([Intel XE#2364])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [SKIP][367] ([Intel XE#1130]) -> [TIMEOUT][368] ([Intel XE#1473]) +1 other test timeout
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html
    - shard-dg2-set2:     [FAIL][369] ([Intel XE#1000]) -> [TIMEOUT][370] ([Intel XE#1473])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          [SKIP][371] ([Intel XE#2322]) -> [SKIP][372] ([Intel XE#1130]) +6 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][373] ([Intel XE#1130]) -> [SKIP][374] ([Intel XE#2322]) +5 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-adlp:         [SKIP][375] ([Intel XE#1392]) -> [TIMEOUT][376] ([Intel XE#1033] / [Intel XE#1727])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][377] -> [SKIP][378] ([Intel XE#1130])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_reset@parallel-close-fd:
    - shard-bmg:          [FAIL][379] ([Intel XE#1081]) -> [SKIP][380] ([Intel XE#1130])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_exec_reset@parallel-close-fd.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_reset@parallel-close-fd.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][381] -> [SKIP][382] ([Intel XE#1130]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-adlp:         [DMESG-WARN][383] ([Intel XE#358]) -> [DMESG-WARN][384] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#358])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_threads@threads-hang-rebind-err.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-bmg:          [DMESG-WARN][385] ([Intel XE#3230]) -> [SKIP][386] ([Intel XE#1130])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][387] ([Intel XE#1192]) -> [SKIP][388] ([Intel XE#2833])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
    - shard-adlp:         [SKIP][389] -> [SKIP][390] ([Intel XE#455])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@xe_live_ktest@xe_eudebug.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@xe_live_ktest@xe_eudebug.html
    - shard-dg2-set2:     [SKIP][391] -> [SKIP][392] ([Intel XE#455])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_live_ktest@xe_eudebug.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-432/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][393] ([Intel XE#2284]) -> [SKIP][394] ([Intel XE#1130]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_pm@d3cold-basic.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][395] ([Intel XE#1130]) -> [SKIP][396] ([Intel XE#2284]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][397] ([Intel XE#579]) -> [SKIP][398] ([Intel XE#1130])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          [SKIP][399] ([Intel XE#944]) -> [SKIP][400] ([Intel XE#1130]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_query@multigpu-query-invalid-query.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][401] ([Intel XE#1130]) -> [SKIP][402] ([Intel XE#944]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2388
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154 -> xe-pw-140392v2

  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154: 24707cf2a7c47d4cd192c97e73d58aa4011de154
  xe-pw-140392v2: 140392v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/index.html

--===============6015064542037353910==
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
<tr><td><b>Series:</b></td><td>series starting with [v1,1/1] drm/xe/guc: Fix missing init value and add register order check (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140392/">https://patchwork.freedesktop.org/series/140392/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154_full -&gt; xe-pw-140392v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140392v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140392v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140392v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-128x128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-128x128.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_psr@pr-suspend.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140392v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808">Intel XE#2808</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +121 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-7/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests timeout</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@core_hotunplug@unplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2388">Intel XE#2388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip@flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> +60 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-8/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a> +8 other tests pass</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-1/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_basic@many-null.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@xe_exec_basic@many-null.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-userptr.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-434/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-4/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-435/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-3/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +1 other test pass</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-2/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@xe_spin_batch@spin-all.html">PASS</a> +123 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-rte.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_exec_reset@parallel-close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_reset@parallel-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_exec_threads@threads-mixed-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-adlp-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-dg2-432/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140392v2/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154 -&gt; xe-pw-140392v2</li>
</ul>
<p>IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154: 24707cf2a7c47d4cd192c97e73d58aa4011de154<br />
  xe-pw-140392v2: 140392v2</p>

</body>
</html>

--===============6015064542037353910==--
