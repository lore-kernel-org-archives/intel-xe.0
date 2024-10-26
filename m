Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC5FD10BED
	for <intel-xe@archiver.kernel.org>; Sat, 26 Oct 2024 23:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09CB10E06B;
	Sat, 26 Oct 2024 23:09:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C4D10E06B;
 Sat, 26 Oct 2024 23:09:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4646515711513056760=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Rework_throttle_ABI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 26 Oct 2024 23:09:09 -0000
Message-ID: <172998414979.1335517.9415595932388215051@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025092238.167042-1-raag.jadav@intel.com>
In-Reply-To: <20241025092238.167042-1-raag.jadav@intel.com>
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

--===============4646515711513056760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rework throttle ABI
URL   : https://patchwork.freedesktop.org/series/140481/
State : failure

== Summary ==

CI Bug Log - changes from xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea_full -> xe-pw-140481v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140481v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140481v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140481v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@invalid-ctm-matrix-sizes:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_color@invalid-ctm-matrix-sizes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-1/igt@kms_color@invalid-ctm-matrix-sizes.html

  * igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-256:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-256.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +2 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-lnl:          [PASS][6] -> [DMESG-WARN][7] +2 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-3/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:
    - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9] +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][10] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  
Known issues
------------

  Here are the changes found in xe-pw-140481v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1125])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] ([Intel XE#3194]) +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][15] -> [FAIL][16] ([Intel XE#1426]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#1426]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#787]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][25] ([Intel XE#1195] / [Intel XE#3113])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2724])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@gamma:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#306])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2252]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2390])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#455]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2321])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2320])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#2930]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-4/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][35] -> [DMESG-WARN][36] ([Intel XE#877]) +2 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [PASS][37] -> [FAIL][38] ([Intel XE#1475])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#1541])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#3184])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_cursor_legacy@torture-bo.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][43] ([Intel XE#2594])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [PASS][44] -> [FAIL][45] ([Intel XE#301]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#301]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#886]) +7 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [PASS][50] -> [FAIL][51] ([Intel XE#886]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-6/igt@kms_flip@plain-flip-ts-check.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#1491]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][54] -> [FAIL][55] ([Intel XE#1874]) +2 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#656]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#651]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#653]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [FAIL][60] ([Intel XE#2333]) +4 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2313]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1503])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#836])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [PASS][64] -> [DMESG-WARN][65] ([Intel XE#2042])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-59:
    - shard-lnl:          [PASS][66] -> [DMESG-WARN][67] ([Intel XE#3184])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1489])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1489])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1122])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2329])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#899]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#2168])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#756])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2905]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#2905]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1473] / [Intel XE#402])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#261] / [Intel XE#688])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][82] -> [INCOMPLETE][83] ([Intel XE#1473]) +2 other tests incomplete
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
    - shard-dg2-set2:     [PASS][84] -> [TIMEOUT][85] ([Intel XE#1473])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#688])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2322]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#288]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-lnl:          [PASS][89] -> [DMESG-WARN][90] ([Intel XE#3230])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html
    - shard-bmg:          [PASS][91] -> [DMESG-WARN][92] ([Intel XE#3230])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - shard-dg2-set2:     [PASS][93] -> [DMESG-WARN][94] ([Intel XE#358])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@xe_exec_reset@close-execqueues-close-fd.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-433/igt@xe_exec_reset@close-execqueues-close-fd.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-lnl:          [PASS][95] -> [DMESG-WARN][96] ([Intel XE#2687])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-6/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_oa@polling:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#2541])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@xe_oa@polling.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2284])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][99] -> [ABORT][100] ([Intel XE#1358] / [Intel XE#1607])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@xe_pm@s4-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][101] -> [ABORT][102] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][103] -> [ABORT][104] ([Intel XE#1358] / [Intel XE#1607])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@xe_pm@s4-exec-after.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][105] ([Intel XE#827]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][107] ([Intel XE#1701]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][109] ([Intel XE#1195]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-lnl:          [FAIL][111] ([Intel XE#1541]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][113] ([Intel XE#2958]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][115] ([Intel XE#301]) -> [PASS][116] +3 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][117] ([Intel XE#301]) -> [PASS][118] +7 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][119] ([Intel XE#886]) -> [PASS][120] +3 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][121] ([Intel XE#3267]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][123] ([Intel XE#2597]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][125] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][127] ([Intel XE#1874]) -> [PASS][128] +2 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][129] ([Intel XE#1430]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][131] ([Intel XE#2042]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][133] ([Intel XE#2883]) -> [PASS][134] +6 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@kms_setmode@basic.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-1/igt@kms_setmode@basic.html

  * igt@xe_drm_fdinfo@utilization-all-full-load:
    - shard-lnl:          [FAIL][135] -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@xe_drm_fdinfo@utilization-all-full-load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-5/igt@xe_drm_fdinfo@utilization-all-full-load.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [FAIL][137] ([Intel XE#2364]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-7/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][139] ([Intel XE#1473]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [INCOMPLETE][141] ([Intel XE#1473]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-bmg:          [DMESG-WARN][143] -> [PASS][144] +5 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_exec_fault_mode@invalid-va.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-7/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@once-invalid-fault:
    - shard-lnl:          [DMESG-WARN][145] -> [PASS][146] +4 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-5/igt@xe_exec_fault_mode@once-invalid-fault.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-8/igt@xe_exec_fault_mode@once-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - shard-adlp:         [DMESG-WARN][147] ([Intel XE#3230]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-9/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - shard-lnl:          [DMESG-WARN][149] ([Intel XE#3230]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-8/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [DMESG-WARN][151] -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-433/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-adlp:         [DMESG-WARN][153] -> [PASS][154] +6 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-3/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [DMESG-WARN][155] ([Intel XE#358]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-shared-vm-basic:
    - shard-adlp:         [DMESG-WARN][157] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#358]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_exec_threads@threads-hang-shared-vm-basic.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@xe_exec_threads@threads-hang-shared-vm-basic.html

  * igt@xe_module_load@many-reload:
    - shard-lnl:          [DMESG-WARN][159] ([Intel XE#2910]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@xe_module_load@many-reload.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-8/igt@xe_module_load@many-reload.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          [DMESG-WARN][161] ([Intel XE#3184]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@xe_pm@d3hot-basic-exec.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-4/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-bmg:          [INCOMPLETE][163] ([Intel XE#2655]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_pm_residency@idle-residency-on-exec.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute:
    - shard-bmg:          [INCOMPLETE][165] -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][167] ([Intel XE#958]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@large-binds-2097152:
    - shard-adlp:         [DMESG-WARN][169] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][170] +2 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_vm@large-binds-2097152.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@xe_vm@large-binds-2097152.html

  * igt@xe_vm@large-userptr-binds-2147483648:
    - shard-adlp:         [TIMEOUT][171] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][172] +4 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@xe_vm@large-userptr-binds-2147483648.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@xe_vm@large-userptr-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [TIMEOUT][173] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [FAIL][174] ([Intel XE#1874])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][175] ([Intel XE#3194]) -> [FAIL][176] ([Intel XE#1231] / [Intel XE#1242]) +1 other test fail
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][177] ([Intel XE#1195]) -> [INCOMPLETE][178] ([Intel XE#1195] / [Intel XE#1727])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#1195] / [Intel XE#3113]) -> [DMESG-WARN][180] ([Intel XE#3113])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][181] ([Intel XE#3149] / [Intel XE#886]) -> [FAIL][182] ([Intel XE#886])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [DMESG-FAIL][183] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][184] ([Intel XE#1861])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         [TIMEOUT][185] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][186] ([Intel XE#1861]) +1 other test fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-adlp:         [TIMEOUT][187] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][188] ([Intel XE#653])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         [INCOMPLETE][189] ([Intel XE#1033] / [Intel XE#1195]) -> [FAIL][190] ([Intel XE#1874])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][191] ([Intel XE#1729]) -> [SKIP][192] ([Intel XE#2426])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          [SKIP][193] ([Intel XE#3026]) -> [SKIP][194] ([Intel XE#2833])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2655]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2655
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910
  [Intel XE#2930]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2930
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#3267]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea -> xe-pw-140481v1

  IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea: 7cadd167321b3267a9803aba88f115fc9809d4ea
  xe-pw-140481v1: 140481v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/index.html

--===============4646515711513056760==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rework throttle ABI</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140481/">https://patchwork.freedesktop.org/series/140481/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea_full -&gt; xe-pw-140481v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140481v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140481v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140481v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_color@invalid-ctm-matrix-sizes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-1/igt@kms_color@invalid-ctm-matrix-sizes.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-256:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-256.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-6/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-3/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140481v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-4/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2930">Intel XE#2930</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_cursor_legacy@torture-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-6/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-2/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@xe_evict@evict-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +2 other tests incomplete</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-433/igt@xe_exec_reset@close-execqueues-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-6/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@xe_oa@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-2/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267">Intel XE#3267</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-1/igt@kms_setmode@basic.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-all-full-load:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@xe_drm_fdinfo@utilization-all-full-load.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-5/igt@xe_drm_fdinfo@utilization-all-full-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-7/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-7/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-5/igt@xe_exec_fault_mode@once-invalid-fault.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-8/igt@xe_exec_fault_mode@once-invalid-fault.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-8/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-9/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-8/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-433/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-3/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_exec_threads@threads-hang-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@xe_exec_threads@threads-hang-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-3/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910">Intel XE#2910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-8/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-2/igt@xe_pm@d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-4/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_pm_residency@idle-residency-on-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2655">Intel XE#2655</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-3/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-2/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_compute.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-2097152:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@xe_vm@large-binds-2097152.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@xe_vm@large-binds-2097152.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@xe_vm@large-userptr-binds-2147483648.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@xe_vm@large-userptr-binds-2147483648.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026">Intel XE#3026</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140481v1/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea -&gt; xe-pw-140481v1</li>
</ul>
<p>IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea: 7cadd167321b3267a9803aba88f115fc9809d4ea<br />
  xe-pw-140481v1: 140481v1</p>

</body>
</html>

--===============4646515711513056760==--
