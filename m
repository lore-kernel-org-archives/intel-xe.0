Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0845D5B17D
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 14:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F54B10E674;
	Tue, 29 Oct 2024 14:12:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1525010E674;
 Tue, 29 Oct 2024 14:12:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1979770336905600016=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display=3A_bunch_of_st?=
 =?utf-8?q?ruct_intel=5Fdisplay_conversions_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 14:12:31 -0000
Message-ID: <173021115106.1359138.12110158926334478951@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730146000.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730146000.git.jani.nikula@intel.com>
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

--===============1979770336905600016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: bunch of struct intel_display conversions (rev5)
URL   : https://patchwork.freedesktop.org/series/140323/
State : failure

== Summary ==

CI Bug Log - changes from xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab_full -> xe-pw-140323v5_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140323v5_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140323v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140323v5_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_cursor_crc@cursor-random-256x85.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y:
    - shard-adlp:         [PASS][5] -> [SKIP][6] +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-bmg:          [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][11] ([Intel XE#2327]) -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-bmg:          [SKIP][13] ([Intel XE#1124]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][15] ([Intel XE#2887]) -> [SKIP][16] +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][17] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][19] ([Intel XE#2311]) -> [SKIP][20] +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          [FAIL][21] ([Intel XE#2333]) -> [SKIP][22] +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][23] ([Intel XE#2313]) -> [SKIP][24] +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][25] ([Intel XE#870]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][27] ([Intel XE#1489]) -> [SKIP][28] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-bmg:          [SKIP][29] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][30] +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_psr@fbc-psr2-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][31] ([Intel XE#2234]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_psr@psr2-primary-render.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [FAIL][33] ([Intel XE#2976]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@xe_oa@oa-exponents.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-3/igt@xe_oa@oa-exponents.html

  
Known issues
------------

  Here are the changes found in xe-pw-140323v5_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#1885])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [PASS][37] -> [FAIL][38] ([Intel XE#3130])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@core_setmaster@master-drop-set-root.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][39] -> [DMESG-FAIL][40] ([Intel XE#1033] / [Intel XE#1727])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [PASS][41] -> [DMESG-WARN][42] ([Intel XE#3194])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#1701]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][45] -> [FAIL][46] ([Intel XE#1426]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][47] -> [FAIL][48] ([Intel XE#1426]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1124]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [FAIL][50] ([Intel XE#3162])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1124]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#619])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1124]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#367])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#367])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#787]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#787]) +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#2907])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2887]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2652] / [Intel XE#787]) +23 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#314]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#306])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#373]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2252])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#373])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#373]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_color@ctm-0-25@pipe-c-edp-1:
    - shard-lnl:          [PASS][69] -> [DMESG-WARN][70] ([Intel XE#2929]) +1 other test dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_color@ctm-0-25@pipe-c-edp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-1/igt@kms_color@ctm-0-25@pipe-c-edp-1.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][71] ([Intel XE#1178]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][72] ([Intel XE#1178])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1424]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#309]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#309]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [PASS][76] -> [FAIL][77] ([Intel XE#1475])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#1541])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][80] ([Intel XE#2141]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#2244])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#455]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2244])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#701])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1138])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1135])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#310]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#301])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1421])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#886]) +5 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][93] -> [ABORT][94] ([Intel XE#2625]) +1 other test abort
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2293]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1401] / [Intel XE#1745])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1401])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2380])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1397] / [Intel XE#1745])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1397])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#2890]) +9 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#455]) +6 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][104] -> [FAIL][105] ([Intel XE#1874])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#651]) +10 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2311])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#656]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#651]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#651]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#656]) +7 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#653]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#653]) +11 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2313])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1339])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1470] / [Intel XE#2853])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][117] -> [SKIP][118] ([Intel XE#455])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#346])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2927])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2927])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#599]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2763]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [PASS][124] -> [SKIP][125] ([Intel XE#2423]) +73 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#2763]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2763]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#870])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#870])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [PASS][131] -> [SKIP][132] ([Intel XE#2446]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_pm_rpm@basic-pci-d3-state.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-lnl:          [PASS][133] -> [DMESG-WARN][134] ([Intel XE#3184])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1489]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#2893])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1489])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#2939])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1437])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][143] -> [FAIL][144] ([Intel XE#2883]) +2 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#330])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][146] -> [FAIL][147] ([Intel XE#899])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][148] -> [FAIL][149] ([Intel XE#1523]) +1 other test fail
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-3/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [PASS][150] -> [ABORT][151] ([Intel XE#1034] / [Intel XE#2625])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][152] -> [ABORT][153] ([Intel XE#1034])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          NOTRUN -> [FAIL][154] ([Intel XE#2443]) +1 other test fail
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#1499])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#756])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#1126])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          [PASS][158] -> [SKIP][159] ([Intel XE#1130]) +166 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#2905]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@discovery-empty:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#2905])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2905])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@xe_eudebug_online@interrupt-other.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#2905]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#688])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][165] -> [TIMEOUT][166] ([Intel XE#1473] / [Intel XE#402])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#261] / [Intel XE#688])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_evict@evict-beng-small-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][168] -> [TIMEOUT][169] ([Intel XE#1473])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][170] -> [FAIL][171] ([Intel XE#1000])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#1392]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#1392])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [PASS][174] -> [DMESG-WARN][175] ([Intel XE#2687])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-7/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#288]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#288]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          [PASS][178] -> [FAIL][179] ([Intel XE#3160])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-lnl:          NOTRUN -> [FAIL][180] ([Intel XE#3160])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [PASS][181] -> [FAIL][182] ([Intel XE#1999]) +2 other tests fail
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#1416])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_mmap@vram.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#379])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#2541])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@oa-exponents@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][186] ([Intel XE#2976])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-3/igt@xe_oa@oa-exponents@rcs-0.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-adlp:         NOTRUN -> [SKIP][187] ([Intel XE#2541]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#977])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][189] -> [ABORT][190] ([Intel XE#1358]) +1 other test abort
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@xe_pm@s2idle-exec-after.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          NOTRUN -> [ABORT][191] ([Intel XE#1358] / [Intel XE#1607])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][192] -> [ABORT][193] ([Intel XE#1794])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_pm@s4-mocs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][194] -> [ABORT][195] ([Intel XE#1794])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][196] -> [FAIL][197] ([Intel XE#958])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         NOTRUN -> [SKIP][198] ([Intel XE#944])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#944])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [SKIP][200] ([Intel XE#1885]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][202] -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][204] ([Intel XE#2134]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@fbdev@eof.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@fbdev@eof.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][206] ([Intel XE#3194]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][208] ([Intel XE#1426]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][210] -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [INCOMPLETE][212] ([Intel XE#3225]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][214] ([Intel XE#2890]) -> [PASS][215] +14 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][216] ([Intel XE#877]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][218] ([Intel XE#877]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][220] -> [PASS][221] +4 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][222] ([Intel XE#301]) -> [PASS][223] +7 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][224] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][226] ([Intel XE#1195]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][228] ([Intel XE#2882]) -> [PASS][229] +1 other test pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [FAIL][230] ([Intel XE#301]) -> [PASS][231] +4 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][232] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][234] ([Intel XE#2049]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][236] ([Intel XE#886]) -> [PASS][237] +9 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-adlp:         [DMESG-WARN][238] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][240] ([Intel XE#1874]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][242] ([Intel XE#616]) -> [PASS][243] +1 other test pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][244] ([Intel XE#2446]) -> [PASS][245] +2 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@i2c.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [SKIP][246] ([Intel XE#2423]) -> [PASS][247] +87 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][248] ([Intel XE#2948]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-4/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][250] ([Intel XE#1130]) -> [PASS][251] +169 other tests pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@many-null:
    - shard-adlp:         [TIMEOUT][252] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@xe_exec_basic@many-null.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@xe_exec_basic@many-null.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-lnl:          [FAIL][254] -> [PASS][255] +2 other tests pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][256] ([Intel XE#2687]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-bmg:          [SKIP][258] ([Intel XE#2229]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][260] ([Intel XE#2136]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_module_load@many-reload.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@xe_module_load@many-reload.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          [DMESG-WARN][262] ([Intel XE#3184]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@xe_pm@d3hot-basic-exec.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-6/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [ABORT][264] ([Intel XE#1358]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-exec-after.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][266] ([Intel XE#1794]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][268] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][269]
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][270] ([Intel XE#2233]) -> [SKIP][271] ([Intel XE#2423])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][272] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [DMESG-FAIL][273] ([Intel XE#1033] / [Intel XE#1727])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][274] ([Intel XE#2423]) -> [SKIP][275] ([Intel XE#873])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][276] ([Intel XE#2423]) -> [SKIP][277] ([Intel XE#2370])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [SKIP][278] ([Intel XE#1124]) -> [TIMEOUT][279] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][280] ([Intel XE#2890]) -> [SKIP][281] ([Intel XE#2327]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][282] ([Intel XE#2327]) -> [SKIP][283] ([Intel XE#2890]) +4 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][284] ([Intel XE#1242]) -> [DMESG-FAIL][285] ([Intel XE#3194])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][286] ([Intel XE#3194]) -> [FAIL][287] ([Intel XE#1231] / [Intel XE#1242])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][288] -> [FAIL][289] ([Intel XE#1231] / [Intel XE#1242])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][290] ([Intel XE#1124]) -> [SKIP][291] ([Intel XE#2890]) +10 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][292] -> [SKIP][293] ([Intel XE#1124]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][294] ([Intel XE#2890]) -> [SKIP][295] ([Intel XE#610]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][296] ([Intel XE#2890]) -> [SKIP][297] ([Intel XE#1124]) +6 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][298] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][299] ([Intel XE#3194]) +1 other test dmesg-fail
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][300] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][301] ([Intel XE#2423])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][302] ([Intel XE#367]) -> [SKIP][303] ([Intel XE#2423]) +3 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][304] ([Intel XE#2887]) -> [SKIP][305] ([Intel XE#2890]) +9 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][306] -> [SKIP][307] ([Intel XE#2887])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][308] ([Intel XE#2890]) -> [SKIP][309] ([Intel XE#2887]) +12 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][310] ([Intel XE#2890]) -> [SKIP][311] ([Intel XE#2652] / [Intel XE#787]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][312] ([Intel XE#2252]) -> [SKIP][313] ([Intel XE#2423]) +11 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][314] ([Intel XE#2325]) -> [SKIP][315] ([Intel XE#2423])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][316] ([Intel XE#2423]) -> [SKIP][317] ([Intel XE#2325])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][318] ([Intel XE#2423]) -> [SKIP][319] ([Intel XE#2252]) +9 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][320] ([Intel XE#2423]) -> [FAIL][321] ([Intel XE#1178])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@atomic.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][322] ([Intel XE#2423]) -> [SKIP][323] ([Intel XE#2341]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@content-type-change.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][324] ([Intel XE#2423]) -> [SKIP][325] ([Intel XE#2390])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][326] ([Intel XE#2390]) -> [SKIP][327] ([Intel XE#2423]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][328] ([Intel XE#1178]) -> [SKIP][329] ([Intel XE#2423])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_content_protection@legacy.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][330] ([Intel XE#2341]) -> [SKIP][331] ([Intel XE#2423])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_content_protection@mei-interface.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][332] ([Intel XE#2423]) -> [SKIP][333] ([Intel XE#2321])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][334] ([Intel XE#2423]) -> [SKIP][335] ([Intel XE#2320]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][336] ([Intel XE#2321]) -> [SKIP][337] ([Intel XE#2423])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          [SKIP][338] ([Intel XE#2320]) -> [SKIP][339] ([Intel XE#2423]) +4 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          [SKIP][340] ([Intel XE#2423]) -> [SKIP][341] ([Intel XE#2286])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][342] ([Intel XE#2286]) -> [SKIP][343] ([Intel XE#2423]) +2 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][344] ([Intel XE#2890]) -> [FAIL][345] ([Intel XE#2141])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][346] ([Intel XE#2423]) -> [SKIP][347] ([Intel XE#2323])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][348] ([Intel XE#2244]) -> [SKIP][349] ([Intel XE#2890]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][350] ([Intel XE#2890]) -> [SKIP][351] ([Intel XE#2244])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [FAIL][352] ([Intel XE#1695]) -> [SKIP][353] ([Intel XE#2890])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][354] ([Intel XE#776]) -> [SKIP][355] ([Intel XE#2890])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-adlp:         [SKIP][356] ([Intel XE#701]) -> [TIMEOUT][357] ([Intel XE#1033] / [Intel XE#1727])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_feature_discovery@chamelium.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][358] ([Intel XE#2374]) -> [SKIP][359] ([Intel XE#2423])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_feature_discovery@psr2.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [FAIL][360] ([Intel XE#2882]) -> [SKIP][361] ([Intel XE#2423])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][362] ([Intel XE#301]) -> [SKIP][363] ([Intel XE#2423])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][364] -> [SKIP][365] ([Intel XE#2380])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][366] ([Intel XE#2890]) -> [SKIP][367] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          [SKIP][368] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][369] ([Intel XE#2890]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [FAIL][370] ([Intel XE#1874]) -> [DMESG-FAIL][371] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#2055])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][372] ([Intel XE#2890]) -> [SKIP][373] ([Intel XE#2311]) +26 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][374] ([Intel XE#2311]) -> [SKIP][375] ([Intel XE#2890]) +19 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][376] -> [SKIP][377] ([Intel XE#2311]) +3 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][378] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][379] ([Intel XE#1861])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][380] ([Intel XE#2333]) -> [SKIP][381] ([Intel XE#2890]) +8 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][382] ([Intel XE#1861]) -> [TIMEOUT][383] ([Intel XE#1033] / [Intel XE#1727])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][384] ([Intel XE#2890]) -> [FAIL][385] ([Intel XE#2333]) +10 other tests fail
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][386] ([Intel XE#2890]) -> [SKIP][387] ([Intel XE#2352])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][388] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][389] ([Intel XE#656])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][390] ([Intel XE#2352]) -> [SKIP][391] ([Intel XE#2890])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][392] -> [SKIP][393] ([Intel XE#2313]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][394] ([Intel XE#2890]) -> [SKIP][395] ([Intel XE#2313]) +23 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][396] ([Intel XE#2313]) -> [SKIP][397] ([Intel XE#2890]) +20 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][398] ([Intel XE#2502]) -> [SKIP][399] ([Intel XE#2423])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][400] ([Intel XE#2890]) -> [SKIP][401] ([Intel XE#2927])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][402] ([Intel XE#2890]) -> [SKIP][403] ([Intel XE#2934])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][404] ([Intel XE#2423]) -> [SKIP][405] ([Intel XE#2486]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][406] ([Intel XE#2423]) -> [SKIP][407] ([Intel XE#2393])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][408] ([Intel XE#2423]) -> [SKIP][409] ([Intel XE#2493])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][410] ([Intel XE#2423]) -> [SKIP][411] ([Intel XE#2763])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][412] ([Intel XE#2763]) -> [SKIP][413] ([Intel XE#2423]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][414] ([Intel XE#2890]) -> [SKIP][415] ([Intel XE#2938])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][416] ([Intel XE#870]) -> [SKIP][417] ([Intel XE#2890])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_pm_backlight@fade.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][418] ([Intel XE#2446]) -> [SKIP][419] ([Intel XE#1439] / [Intel XE#3141]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][420] ([Intel XE#1489]) -> [SKIP][421] ([Intel XE#2890]) +2 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][422] -> [SKIP][423] ([Intel XE#1489]) +2 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][424] ([Intel XE#2890]) -> [SKIP][425] ([Intel XE#1489]) +4 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][426] ([Intel XE#2387]) -> [SKIP][427] ([Intel XE#2890])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][428] ([Intel XE#2890]) -> [SKIP][429] ([Intel XE#2387]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][430] -> [SKIP][431] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          [SKIP][432] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][433] ([Intel XE#2890]) +7 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr@pr-sprite-render.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][434] ([Intel XE#2890]) -> [SKIP][435] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][436] ([Intel XE#2423]) -> [SKIP][437] ([Intel XE#2330])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][438] ([Intel XE#2329]) -> [SKIP][439] ([Intel XE#2423]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][440] ([Intel XE#2413]) -> [SKIP][441] ([Intel XE#2423])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][442] ([Intel XE#2426]) -> [FAIL][443] ([Intel XE#1729])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][444] ([Intel XE#1499]) -> [SKIP][445] ([Intel XE#2423]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_vrr@max-min.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][446] ([Intel XE#2423]) -> [SKIP][447] ([Intel XE#1499])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][448] ([Intel XE#756]) -> [SKIP][449] ([Intel XE#2423]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [FAIL][450] ([Intel XE#1050]) -> [SKIP][451] ([Intel XE#1130])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_compute@ccs-mode-compute-kernel.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][452] ([Intel XE#1130]) -> [SKIP][453] ([Intel XE#2504])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          [SKIP][454] ([Intel XE#1130]) -> [SKIP][455] ([Intel XE#2905]) +9 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][456] ([Intel XE#2905]) -> [SKIP][457] ([Intel XE#1130]) +8 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [SKIP][458] ([Intel XE#1130]) -> [TIMEOUT][459] ([Intel XE#1473])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][460] ([Intel XE#2322]) -> [SKIP][461] ([Intel XE#1130]) +8 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][462] ([Intel XE#1130]) -> [SKIP][463] ([Intel XE#2322]) +8 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][464] -> [SKIP][465] ([Intel XE#1130]) +2 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][466] ([Intel XE#1130]) -> [SKIP][467] ([Intel XE#586])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_mmap@small-bar.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][468] ([Intel XE#2236]) -> [SKIP][469] ([Intel XE#1130])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][470] ([Intel XE#1130]) -> [SKIP][471] ([Intel XE#2284])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][472] ([Intel XE#2284]) -> [SKIP][473] ([Intel XE#1130])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][474] ([Intel XE#944]) -> [SKIP][475] ([Intel XE#1130]) +3 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][476] ([Intel XE#1130]) -> [SKIP][477] ([Intel XE#944])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -> xe-pw-140323v5

  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab
  xe-pw-140323v5: 140323v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/index.html

--===============1979770336905600016==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: bunch of struct intel_display conversions (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140323/">https://patchwork.freedesktop.org/series/140323/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab_full -&gt; xe-pw-140323v5_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140323v5_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140323v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140323v5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-0.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_cursor_crc@cursor-random-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_cursor_crc@cursor-random-256x85.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976">Intel XE#2976</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-3/igt@xe_oa@oa-exponents.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140323v5_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162">Intel XE#3162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_color@ctm-0-25@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-1/igt@kms_color@ctm-0-25@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_evict@evict-beng-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-7/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_oa@invalid-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-3/igt@xe_oa@oa-exponents@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976">Intel XE#2976</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-466/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@core_setmaster@master-drop-set-user.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@fbdev@eof.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_pm_rpm@i2c.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html">PASS</a> +87 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-4/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> +169 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@xe_exec_basic@many-null.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@xe_exec_basic@many-null.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-lnl-1/igt@xe_pm@d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-lnl-6/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-433/igt@xe_pm@s3-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-8/igt@kms_feature_discovery@chamelium.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v5/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -&gt; xe-pw-140323v5</li>
</ul>
<p>IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab<br />
  xe-pw-140323v5: 140323v5</p>

</body>
</html>

--===============1979770336905600016==--
