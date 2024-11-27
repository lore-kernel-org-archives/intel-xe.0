Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB378D6ACC0
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 11:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C1510EA92;
	Wed, 27 Nov 2024 11:32:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4BD10EA8C;
 Wed, 27 Nov 2024 11:32:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8312941046852757141=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Revert_accidentally_and_un?=
 =?utf-8?q?intentionally_pushed?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 11:32:18 -0000
Message-ID: <173270713828.3666921.15834219014682145066@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127083042.358726-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241127083042.358726-1-himal.prasad.ghimiray@intel.com>
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

--===============8312941046852757141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert accidentally and unintentionally pushed
URL   : https://patchwork.freedesktop.org/series/141824/
State : failure

== Summary ==

CI Bug Log - changes from xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a_full -> xe-pw-141824v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141824v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141824v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141824v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@core_getversion@basic.html

  * igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@query-forked-busy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr:
    - shard-lnl:          ([PASS][5], [PASS][6]) -> [FAIL][7]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-5/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-1/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-3/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [PASS][8] -> [INCOMPLETE][9] +2 other tests incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([FAIL][10], [FAIL][11]) ([Intel XE#3600]) -> [DMESG-FAIL][12]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-dg2-set2:     [SKIP][13] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_plane_multiple@tiling-x.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_vblank@query-forked-busy:
    - shard-bmg:          [SKIP][15] ([Intel XE#2423]) -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_vblank@query-forked-busy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_vblank@query-forked-busy.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-bmg:          ([FAIL][17], [FAIL][18]) ([Intel XE#3604]) -> [FAIL][19]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_exec_threads@threads-cm-userptr.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_exec_threads@threads-cm-userptr.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          ([DMESG-WARN][20], [PASS][21]) ([Intel XE#3467]) -> [FAIL][22]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_module_load@many-reload.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_module_load@many-reload.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          ([FAIL][23], [PASS][24]) -> [FAIL][25]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_module_load@reload-no-display.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_module_load@reload-no-display.html

  
Known issues
------------

  Here are the changes found in xe-pw-141824v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          ([PASS][26], [PASS][27]) -> [SKIP][28] ([Intel XE#1885])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@core_hotunplug@hotrebind.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@core_hotunplug@hotrebind.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          ([PASS][29], [PASS][30]) -> [FAIL][31] ([Intel XE#3339])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-bmg:          ([PASS][32], [PASS][33]) -> [SKIP][34] ([Intel XE#2134]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@fbdev@info.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@fbdev@info.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@fbdev@info.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2134])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@fbdev@unaligned-read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         ([PASS][36], [PASS][37]) -> [FAIL][38] ([Intel XE#1426]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2136]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          ([PASS][41], [PASS][42]) -> [SKIP][43] ([Intel XE#2136]) +13 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_big_fb@x-tiled-addfb.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_big_fb@x-tiled-addfb.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][44] ([Intel XE#3468])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#367])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +20 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2887])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][50] -> [DMESG-WARN][51] ([Intel XE#2953] / [Intel XE#3086])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2423]) +13 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#2882])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2316]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          ([PASS][57], [PASS][58]) -> [SKIP][59] ([Intel XE#2423]) +59 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#455])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2293]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2380])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2311]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2136]) +18 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2313])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2423]) +32 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         ([PASS][68], [PASS][69]) -> [DMESG-WARN][70] ([Intel XE#3086]) +1 other test dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2763]) +11 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          ([PASS][72], [PASS][73]) -> [SKIP][74] ([Intel XE#2446])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#2446])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1489])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2234] / [Intel XE#2850])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         ([PASS][79], [PASS][80]) -> [FAIL][81] ([Intel XE#771] / [Intel XE#899])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         ([PASS][82], [PASS][83]) -> [FAIL][84] ([Intel XE#899])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          ([PASS][85], [PASS][86]) -> [FAIL][87] ([Intel XE#899]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#1130]) +63 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html

  * igt@xe_exec_balancer@many-parallel-userptr-rebind:
    - shard-bmg:          [PASS][90] -> [DMESG-WARN][91] ([Intel XE#1727])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-rebind.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_exec_balancer@many-parallel-userptr-rebind.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          ([PASS][92], [PASS][93]) -> [SKIP][94] ([Intel XE#1130]) +124 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1130]) +26 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - shard-adlp:         [PASS][96] -> [DMESG-WARN][97] ([Intel XE#3086]) +2 other tests dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-8/igt@xe_exec_reset@virtual-close-fd-no-exec.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2905])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [PASS][99] -> [ABORT][100] ([Intel XE#2625])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_oa@oa-exponents@rcs-0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][101] ([Intel XE#3468])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_oa@oa-exponents@rcs-0.html

  * igt@xe_pm@s2idle-basic:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][102] ([Intel XE#1727] / [Intel XE#3468])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         ([PASS][103], [PASS][104]) -> [ABORT][105] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          ([PASS][106], [PASS][107]) -> [FAIL][108] ([Intel XE#958])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          ([PASS][109], [FAIL][110]) ([Intel XE#3249]) -> [PASS][111]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@core_getversion@all-cards.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@core_getversion@all-cards.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          ([PASS][112], [SKIP][113]) ([Intel XE#1885]) -> [PASS][114] +2 other tests pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@core_hotunplug@hotrebind-lateclose.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1885]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          ([PASS][117], [SKIP][118]) ([Intel XE#3453]) -> [PASS][119]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][120] ([Intel XE#2134]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@fbdev@nullptr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#2134]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@fbdev@read.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@fbdev@read.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          ([SKIP][124], [PASS][125]) ([Intel XE#2134]) -> [PASS][126] +2 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@fbdev@unaligned-write.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@fbdev@unaligned-write.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@fbdev@unaligned-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][127] ([Intel XE#1426]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     ([PASS][129], [SKIP][130]) ([Intel XE#2136]) -> [PASS][131] +9 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          ([PASS][132], [SKIP][133]) ([Intel XE#2136]) -> [PASS][134] +20 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][135] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][138] +2 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          ([SKIP][139], [PASS][140]) ([Intel XE#2291]) -> [PASS][141]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#2423] / [i915#2575]) -> [PASS][143] +23 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-bmg:          [SKIP][144] ([Intel XE#2136]) -> [PASS][145] +11 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          ([PASS][146], [SKIP][147]) ([Intel XE#2423]) -> [PASS][148] +115 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     ([SKIP][149], [PASS][150]) ([Intel XE#2423] / [i915#2575]) -> [PASS][151] +36 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_flip@busy-flip.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_flip@busy-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          ([FAIL][152], [PASS][153]) ([Intel XE#886]) -> [PASS][154] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3:
    - shard-bmg:          ([DMESG-WARN][155], [PASS][156]) ([Intel XE#3468]) -> [PASS][157] +9 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         ([DMESG-WARN][158], [PASS][159]) ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][160] +4 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     ([PASS][161], [SKIP][162]) ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][163] +3 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#2136]) -> [PASS][165] +5 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-lnl:          ([PASS][166], [DMESG-WARN][167]) ([Intel XE#2932]) -> [PASS][168]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_lease@cursor-implicit-plane:
    - shard-bmg:          [SKIP][169] ([Intel XE#2423]) -> [PASS][170] +53 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_lease@cursor-implicit-plane.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_lease@cursor-implicit-plane.html

  * igt@kms_mmap_write_crc@main@pipe-a-dp-2:
    - shard-bmg:          ([DMESG-FAIL][171], [PASS][172]) ([Intel XE#3468]) -> [PASS][173] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_mmap_write_crc@main@pipe-a-dp-2.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_mmap_write_crc@main@pipe-a-dp-2.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@kms_mmap_write_crc@main@pipe-a-dp-2.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-bmg:          ([DMESG-WARN][174], [SKIP][175]) ([Intel XE#2423] / [Intel XE#3468]) -> [PASS][176] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-bmg:          [DMESG-WARN][177] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:
    - shard-bmg:          [DMESG-WARN][179] ([Intel XE#3468]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          ([PASS][181], [DMESG-WARN][182]) ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][183]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_pm_rpm@basic-pci-d3-state.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_pm_rpm@basic-pci-d3-state.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          ([PASS][184], [SKIP][185]) ([Intel XE#2446]) -> [PASS][186] +4 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_pm_rpm@cursor.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_rpm@cursor.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_pm_rpm@cursor.html
    - shard-lnl:          ([DMESG-WARN][187], [PASS][188]) ([Intel XE#3184]) -> [PASS][189]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-7/igt@kms_pm_rpm@cursor.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-4/igt@kms_pm_rpm@cursor.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-7/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [SKIP][190] ([Intel XE#2446]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     ([SKIP][192], [PASS][193]) ([Intel XE#2446]) -> [PASS][194]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          ([PASS][195], [FAIL][196]) ([Intel XE#899]) -> [PASS][197]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          ([DMESG-WARN][198], [PASS][199]) ([Intel XE#3426]) -> [PASS][200]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          ([PASS][201], [DMESG-WARN][202]) -> [PASS][203]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [DMESG-WARN][204] ([Intel XE#2932]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-6/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-6/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-dg2-set2:     ([PASS][206], [SKIP][207]) ([Intel XE#1130]) -> [PASS][208] +63 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_balancer@many-execqueues-virtual-rebind:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1130]) -> [PASS][210] +43 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html

  * igt@xe_exec_balancer@twice-parallel-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][211] ([Intel XE#1727]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          ([PASS][213], [SKIP][214]) ([Intel XE#1130]) -> [PASS][215] +254 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@twice-basic:
    - shard-bmg:          ([SKIP][216], [DMESG-WARN][217]) ([Intel XE#1130]) -> [PASS][218]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_basic@twice-basic.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_exec_basic@twice-basic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_exec_basic@twice-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
    - shard-bmg:          [SKIP][219] ([Intel XE#1130]) -> [PASS][220] +120 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html

  * igt@xe_exec_threads@threads-bal-fd-rebind:
    - shard-bmg:          ([SKIP][221], [DMESG-WARN][222]) ([Intel XE#1130] / [Intel XE#3468]) -> [PASS][223] +2 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_threads@threads-bal-fd-rebind.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_exec_threads@threads-bal-fd-rebind.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_exec_threads@threads-bal-fd-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-adlp:         ([DMESG-WARN][224], [PASS][225]) ([Intel XE#3086] / [Intel XE#3343]) -> [PASS][226] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          ([DMESG-WARN][227], [SKIP][228]) ([Intel XE#1130] / [Intel XE#3343]) -> [PASS][229]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         ([DMESG-WARN][230], [PASS][231]) ([Intel XE#3086]) -> [PASS][232] +8 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-lnl:          ([PASS][233], [ABORT][234]) -> [PASS][235]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          ([PASS][236], [FAIL][237]) ([Intel XE#1999]) -> [PASS][238] +2 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-lnl:          [DMESG-WARN][239] -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-3/igt@xe_module_load@many-reload.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-1/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-bmg:          ([PASS][241], [FAIL][242]) -> [PASS][243] +1 other test pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_module_load@reload.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_module_load@reload.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_module_load@reload.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-bmg:          ([DMESG-WARN][244], [SKIP][245]) ([Intel XE#1130] / [Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][246]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_pm@s3-vm-bind-unbind-all.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         ([ABORT][247], [PASS][248]) ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][249]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          ([PASS][250], [DMESG-FAIL][251]) ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][252] +1 other test pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_waitfence@invalid-flag:
    - shard-bmg:          ([PASS][253], [DMESG-WARN][254]) ([Intel XE#1727]) -> [PASS][255] +2 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_waitfence@invalid-flag.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_waitfence@invalid-flag.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@xe_waitfence@invalid-flag.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-adlp:         ([DMESG-WARN][256], [PASS][257]) ([Intel XE#3086] / [Intel XE#358]) -> [PASS][258]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-1/igt@xe_wedged@wedged-mode-toggle.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@xe_wedged@wedged-mode-toggle.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-8/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     ([PASS][259], [FAIL][260]) ([Intel XE#3440]) -> [FAIL][261] ([Intel XE#3440]) +1 other test fail
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@core_getversion@all-cards.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@core_getversion@all-cards.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     ([DMESG-WARN][262], [SKIP][263]) ([Intel XE#1885] / [Intel XE#3468]) -> [DMESG-WARN][264] ([Intel XE#3468])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     ([PASS][265], [SKIP][266]) ([Intel XE#1885]) -> [SKIP][267] ([Intel XE#1885])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@core_hotunplug@hotreplug.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@core_hotunplug@hotreplug.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          ([PASS][268], [SKIP][269]) ([Intel XE#1885]) -> [SKIP][270] ([Intel XE#1885])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     ([SKIP][271], [PASS][272]) ([Intel XE#2134]) -> [SKIP][273] ([Intel XE#2134])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@fbdev@unaligned-write.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@fbdev@unaligned-write.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@fbdev@unaligned-write.html

  * igt@kms_3d:
    - shard-bmg:          [DMESG-WARN][274] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-FAIL][275] ([Intel XE#1727] / [Intel XE#3468])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_3d.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     ([SKIP][276], [SKIP][277]) ([Intel XE#2423] / [Intel XE#623] / [i915#2575]) -> [SKIP][278] ([Intel XE#2423] / [i915#2575])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          ([SKIP][279], [SKIP][280]) ([Intel XE#2423] / [Intel XE#873]) -> [SKIP][281] ([Intel XE#2423])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_async_flips@invalid-async-flip.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          ([SKIP][282], [SKIP][283]) ([Intel XE#2385] / [Intel XE#2423]) -> [SKIP][284] ([Intel XE#2385])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          ([SKIP][285], [SKIP][286]) ([Intel XE#2370]) -> [SKIP][287] ([Intel XE#2423])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     ([PASS][288], [SKIP][289]) ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#2136]) +11 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          ([SKIP][291], [SKIP][292]) ([Intel XE#2136] / [Intel XE#2327]) -> [SKIP][293] ([Intel XE#2136]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     ([SKIP][294], [SKIP][295]) ([Intel XE#2136] / [Intel XE#316]) -> [SKIP][296] ([Intel XE#2136]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          ([SKIP][297], [SKIP][298]) ([Intel XE#2327]) -> [SKIP][299] ([Intel XE#2136]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-dg2-set2:     ([PASS][300], [SKIP][301]) ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][302] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          ([SKIP][303], [SKIP][304]) ([Intel XE#2136] / [Intel XE#2327]) -> [SKIP][305] ([Intel XE#2327]) +7 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          ([PASS][306], [SKIP][307]) ([Intel XE#2136]) -> [SKIP][308] ([Intel XE#2136]) +13 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          ([DMESG-WARN][309], [DMESG-WARN][310]) ([Intel XE#3468]) -> [DMESG-FAIL][311] ([Intel XE#3468])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][312] ([Intel XE#2136]) -> [SKIP][313] ([Intel XE#2327]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     ([SKIP][314], [SKIP][315]) ([Intel XE#2136] / [Intel XE#316]) -> [SKIP][316] ([Intel XE#316]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     ([SKIP][317], [SKIP][318]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#316]) -> [SKIP][319] ([Intel XE#316])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([FAIL][320], [FAIL][321]) ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][322] ([Intel XE#324])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         ([FAIL][323], [DMESG-FAIL][324]) ([Intel XE#1242] / [Intel XE#324]) -> [DMESG-FAIL][325] ([Intel XE#324])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-bmg:          ([SKIP][326], [SKIP][327]) ([Intel XE#1124] / [Intel XE#2136]) -> [SKIP][328] ([Intel XE#2136]) +10 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         ([INCOMPLETE][329], [FAIL][330]) ([Intel XE#1874]) -> [FAIL][331] ([Intel XE#1874])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-9/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     ([SKIP][332], [SKIP][333]) ([Intel XE#1124] / [Intel XE#2136] / [Intel XE#2351]) -> [SKIP][334] ([Intel XE#1124]) +2 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          ([SKIP][335], [SKIP][336]) ([Intel XE#2328]) -> [SKIP][337] ([Intel XE#2136])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     ([SKIP][338], [SKIP][339]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#607]) -> [SKIP][340] ([Intel XE#2136] / [Intel XE#2351])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2136]) -> [SKIP][342] ([Intel XE#610])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-bmg:          ([SKIP][343], [SKIP][344]) ([Intel XE#2136] / [Intel XE#610]) -> [SKIP][345] ([Intel XE#610])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][346] ([Intel XE#2136]) -> [SKIP][347] ([Intel XE#1124]) +6 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          ([SKIP][348], [SKIP][349]) ([Intel XE#1124] / [Intel XE#2136]) -> [SKIP][350] ([Intel XE#1124]) +15 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][351] ([Intel XE#1124]) -> [SKIP][352] ([Intel XE#2136]) +4 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     ([SKIP][353], [SKIP][354]) ([Intel XE#1124] / [Intel XE#2136]) -> [SKIP][355] ([Intel XE#2136]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     ([SKIP][356], [SKIP][357]) ([Intel XE#1124] / [Intel XE#2136] / [Intel XE#2351]) -> [SKIP][358] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     ([SKIP][359], [SKIP][360]) ([Intel XE#1124] / [Intel XE#2136]) -> [SKIP][361] ([Intel XE#1124]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-bmg:          ([SKIP][362], [SKIP][363]) ([Intel XE#1124]) -> [SKIP][364] ([Intel XE#2136]) +5 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          ([SKIP][365], [SKIP][366]) ([Intel XE#2136] / [Intel XE#2328]) -> [SKIP][367] ([Intel XE#2136])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          ([SKIP][368], [SKIP][369]) ([Intel XE#607]) -> [SKIP][370] ([Intel XE#2136]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          ([PASS][371], [SKIP][372]) ([Intel XE#2423]) -> [SKIP][373] ([Intel XE#2314] / [Intel XE#2894])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     ([SKIP][374], [SKIP][375]) ([Intel XE#2423] / [Intel XE#367] / [i915#2575]) -> [SKIP][376] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          ([SKIP][377], [SKIP][378]) ([Intel XE#2314] / [Intel XE#2423] / [Intel XE#2894]) -> [SKIP][379] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     ([SKIP][380], [SKIP][381]) ([Intel XE#2191] / [Intel XE#2423] / [i915#2575]) -> [SKIP][382] ([Intel XE#2423] / [i915#2575])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          ([SKIP][383], [SKIP][384]) ([Intel XE#2314] / [Intel XE#2423] / [Intel XE#2894]) -> [SKIP][385] ([Intel XE#2423])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#2423] / [i915#2575]) -> [SKIP][387] ([Intel XE#2191]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][388] ([Intel XE#2423]) -> [SKIP][389] ([Intel XE#2314] / [Intel XE#2894])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          ([SKIP][390], [SKIP][391]) ([Intel XE#2423] / [Intel XE#367]) -> [SKIP][392] ([Intel XE#367]) +2 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          ([SKIP][393], [SKIP][394]) ([Intel XE#2423] / [Intel XE#367]) -> [SKIP][395] ([Intel XE#2423]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][396] ([Intel XE#2423]) -> [SKIP][397] ([Intel XE#367]) +2 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     ([SKIP][398], [SKIP][399]) ([Intel XE#2423] / [Intel XE#367] / [i915#2575]) -> [SKIP][400] ([Intel XE#367]) +2 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          ([SKIP][401], [SKIP][402]) ([Intel XE#367]) -> [SKIP][403] ([Intel XE#2423]) +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][404] ([Intel XE#2136]) -> [SKIP][405] ([Intel XE#2887]) +9 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][406] ([Intel XE#2887]) -> [SKIP][407] ([Intel XE#2136]) +4 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2136]) -> [SKIP][409] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          ([INCOMPLETE][410], [DMESG-FAIL][411]) ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-FAIL][412] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2-set2:     ([SKIP][413], [SKIP][414]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][415] ([Intel XE#2136] / [Intel XE#2351])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     ([SKIP][416], [SKIP][417]) ([Intel XE#2136] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][418] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          ([SKIP][419], [SKIP][420]) ([Intel XE#2136] / [Intel XE#2887]) -> [SKIP][421] ([Intel XE#2136]) +13 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
    - shard-dg2-set2:     ([SKIP][422], [SKIP][423]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][424] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][425] ([Intel XE#3432]) -> [SKIP][426] ([Intel XE#2136]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][427] ([Intel XE#2136]) -> [SKIP][428] ([Intel XE#3432])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][429] ([Intel XE#2136]) -> [SKIP][430] ([Intel XE#2652] / [Intel XE#787])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          ([SKIP][431], [SKIP][432]) ([Intel XE#2136] / [Intel XE#3432]) -> [SKIP][433] ([Intel XE#3432]) +2 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          ([SKIP][434], [SKIP][435]) ([Intel XE#2136] / [Intel XE#3432]) -> [SKIP][436] ([Intel XE#2136])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          ([SKIP][437], [INCOMPLETE][438]) ([Intel XE#1727] / [Intel XE#2136] / [Intel XE#3468]) -> [SKIP][439] ([Intel XE#2136]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          ([SKIP][440], [SKIP][441]) ([Intel XE#2887]) -> [SKIP][442] ([Intel XE#2136]) +9 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          ([SKIP][443], [SKIP][444]) ([Intel XE#2136] / [Intel XE#2652] / [Intel XE#787]) -> [SKIP][445] ([Intel XE#2652] / [Intel XE#787])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          ([SKIP][446], [SKIP][447]) ([Intel XE#2136] / [Intel XE#2887]) -> [SKIP][448] ([Intel XE#2887]) +22 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-dg2-set2:     ([SKIP][449], [SKIP][450]) ([Intel XE#2136] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][451] ([Intel XE#2136]) +9 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          ([SKIP][452], [SKIP][453]) ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][454] ([Intel XE#2136]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][455] ([Intel XE#2136]) -> [SKIP][456] ([Intel XE#2724])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          ([SKIP][457], [SKIP][458]) ([Intel XE#2724]) -> [SKIP][459] ([Intel XE#2136])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_cdclk@plane-scaling.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#2423] / [i915#2575]) -> [SKIP][461] ([Intel XE#373]) +1 other test skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_chamelium_audio@dp-audio-edid.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          ([SKIP][462], [SKIP][463]) ([Intel XE#2325]) -> [SKIP][464] ([Intel XE#2423])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
    - shard-dg2-set2:     ([SKIP][465], [SKIP][466]) ([Intel XE#2423] / [Intel XE#306] / [i915#2575]) -> [SKIP][467] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          ([SKIP][468], [SKIP][469]) ([Intel XE#2325] / [Intel XE#2423]) -> [SKIP][470] ([Intel XE#2325]) +2 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          ([SKIP][471], [SKIP][472]) ([Intel XE#2325] / [Intel XE#2423]) -> [SKIP][473] ([Intel XE#2423]) +1 other test skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_chamelium_color@ctm-limited-range.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_chamelium_color@ctm-limited-range.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#2423] / [i915#2575]) -> [SKIP][475] ([Intel XE#306])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][476] ([Intel XE#2325]) -> [SKIP][477] ([Intel XE#2423])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_chamelium_color@degamma.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          ([SKIP][478], [SKIP][479]) ([Intel XE#2252] / [Intel XE#2423]) -> [SKIP][480] ([Intel XE#2423]) +5 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-read.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-read.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     ([SKIP][481], [SKIP][482]) ([Intel XE#2423] / [Intel XE#373] / [i915#2575]) -> [SKIP][483] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     ([SKIP][484], [SKIP][485]) ([Intel XE#2423] / [Intel XE#373] / [i915#2575]) -> [SKIP][486] ([Intel XE#373]) +2 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_chamelium_frames@vga-frame-dump.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][487] ([Intel XE#2423]) -> [SKIP][488] ([Intel XE#2252]) +8 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][489] ([Intel XE#2252]) -> [SKIP][490] ([Intel XE#2423]) +3 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          ([SKIP][491], [SKIP][492]) ([Intel XE#2252] / [Intel XE#2423]) -> [SKIP][493] ([Intel XE#2252]) +14 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-bmg:          ([SKIP][494], [SKIP][495]) ([Intel XE#2252]) -> [SKIP][496] ([Intel XE#2423]) +6 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color@deep-color:
    - shard-bmg:          ([PASS][497], [SKIP][498]) ([Intel XE#2423]) -> [SKIP][499] ([Intel XE#2423]) +56 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_color@deep-color.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_color@deep-color.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          ([FAIL][500], [SKIP][501]) ([Intel XE#1178] / [Intel XE#2423]) -> [FAIL][502] ([Intel XE#1178])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          ([SKIP][503], [SKIP][504]) ([Intel XE#2341] / [Intel XE#2423]) -> [SKIP][505] ([Intel XE#2423])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_content_protection@content-type-change.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_content_protection@content-type-change.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     ([SKIP][506], [SKIP][507]) ([Intel XE#2423] / [Intel XE#307] / [i915#2575]) -> [SKIP][508] ([Intel XE#307]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][509] ([Intel XE#2423]) -> [SKIP][510] ([Intel XE#2390])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          ([SKIP][511], [SKIP][512]) ([Intel XE#2390] / [Intel XE#2423]) -> [SKIP][513] ([Intel XE#2390]) +1 other test skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     ([SKIP][514], [SKIP][515]) ([Intel XE#2423] / [Intel XE#455] / [i915#2575]) -> [SKIP][516] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_content_protection@lic-type-1.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_content_protection@lic-type-1.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          ([SKIP][517], [FAIL][518]) ([Intel XE#1178] / [Intel XE#2423]) -> [SKIP][519] ([Intel XE#2423])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_content_protection@srm.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_content_protection@srm.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          ([SKIP][520], [SKIP][521]) ([Intel XE#2341]) -> [SKIP][522] ([Intel XE#2423])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_content_protection@type1.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_content_protection@type1.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     ([FAIL][523], [SKIP][524]) ([Intel XE#1188] / [Intel XE#2423] / [i915#2575]) -> [SKIP][525] ([Intel XE#2423] / [i915#2575])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_content_protection@uevent.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_content_protection@uevent.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_content_protection@uevent.html
    - shard-bmg:          [FAIL][526] ([Intel XE#1188]) -> [SKIP][527] ([Intel XE#2423])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_content_protection@uevent.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][528] ([Intel XE#2423]) -> [SKIP][529] ([Intel XE#2320]) +2 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     ([SKIP][530], [SKIP][531]) ([Intel XE#2423] / [Intel XE#308] / [i915#2575]) -> [SKIP][532] ([Intel XE#308])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-bmg:          ([SKIP][533], [DMESG-FAIL][534]) ([Intel XE#2423] / [Intel XE#3468]) -> [DMESG-FAIL][535] ([Intel XE#3468])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          ([SKIP][536], [SKIP][537]) ([Intel XE#2320] / [Intel XE#2423]) -> [SKIP][538] ([Intel XE#2423]) +2 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          ([SKIP][539], [SKIP][540]) ([Intel XE#2321] / [Intel XE#2423]) -> [SKIP][541] ([Intel XE#2423]) +1 other test skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          [SKIP][542] ([Intel XE#2320]) -> [SKIP][543] ([Intel XE#2423]) +2 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          ([SKIP][544], [SKIP][545]) ([Intel XE#2320]) -> [SKIP][546] ([Intel XE#2423]) +1 other test skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          ([SKIP][547], [SKIP][548]) ([Intel XE#2320] / [Intel XE#2423]) -> [SKIP][549] ([Intel XE#2320]) +5 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     ([SKIP][550], [SKIP][551]) ([Intel XE#2423] / [Intel XE#308] / [i915#2575]) -> [SKIP][552] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x512.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          ([SKIP][553], [SKIP][554]) ([Intel XE#2321]) -> [SKIP][555] ([Intel XE#2423])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][556] ([Intel XE#2423]) -> [SKIP][557] ([Intel XE#2321])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          ([SKIP][558], [SKIP][559]) ([Intel XE#2321] / [Intel XE#2423]) -> [SKIP][560] ([Intel XE#2321]) +1 other test skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     ([PASS][561], [SKIP][562]) ([Intel XE#2423] / [i915#2575]) -> [SKIP][563] ([Intel XE#2423] / [i915#2575]) +66 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][564] ([Intel XE#2423]) -> [SKIP][565] ([Intel XE#2291]) +2 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          ([SKIP][566], [SKIP][567]) ([Intel XE#2286] / [Intel XE#2423]) -> [SKIP][568] ([Intel XE#2286]) +2 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][569] ([Intel XE#2423]) -> [SKIP][570] ([Intel XE#2286])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          ([SKIP][571], [PASS][572]) ([Intel XE#2423]) -> [SKIP][573] ([Intel XE#2291]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          ([SKIP][574], [SKIP][575]) ([Intel XE#2291] / [Intel XE#2423]) -> [SKIP][576] ([Intel XE#2423])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          ([SKIP][577], [DMESG-WARN][578]) ([Intel XE#2423] / [Intel XE#877]) -> [SKIP][579] ([Intel XE#2423])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][580] ([Intel XE#877]) -> [SKIP][581] ([Intel XE#2423])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     ([SKIP][582], [SKIP][583]) ([Intel XE#2423] / [Intel XE#323] / [i915#2575]) -> [SKIP][584] ([Intel XE#323])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-bmg:          ([SKIP][585], [SKIP][586]) ([Intel XE#2286] / [Intel XE#2423]) -> [SKIP][587] ([Intel XE#2423])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          ([FAIL][588], [FAIL][589]) ([Intel XE#2141]) -> [SKIP][590] ([Intel XE#2136])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          ([SKIP][591], [SKIP][592]) ([Intel XE#2323] / [Intel XE#2423]) -> [SKIP][593] ([Intel XE#2323])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_display_modes@mst-extended-mode-negative.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          ([SKIP][594], [SKIP][595]) ([Intel XE#1340] / [Intel XE#2423]) -> [SKIP][596] ([Intel XE#2423])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     ([SKIP][597], [SKIP][598]) ([Intel XE#2351] / [Intel XE#455]) -> [SKIP][599] ([Intel XE#2351])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_dsc@dsc-basic.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_dsc@dsc-basic.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_dsc@dsc-basic.html
    - shard-bmg:          ([SKIP][600], [SKIP][601]) ([Intel XE#2244]) -> [SKIP][602] ([Intel XE#2136])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_dsc@dsc-basic.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_dsc@dsc-basic.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          ([SKIP][603], [SKIP][604]) ([Intel XE#2136] / [Intel XE#2244]) -> [SKIP][605] ([Intel XE#2136])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][606] ([Intel XE#2136]) -> [SKIP][607] ([Intel XE#2244])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          ([SKIP][608], [SKIP][609]) ([Intel XE#2136] / [Intel XE#2244]) -> [SKIP][610] ([Intel XE#2244]) +2 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][612] ([Intel XE#455]) +1 other test skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     ([SKIP][613], [SKIP][614]) ([Intel XE#2136] / [Intel XE#455]) -> [SKIP][615] ([Intel XE#455])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][616] ([Intel XE#2136]) -> [FAIL][617] ([Intel XE#1695])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     ([INCOMPLETE][618], [SKIP][619]) ([Intel XE#1727] / [Intel XE#2136] / [Intel XE#3468]) -> [SKIP][620] ([Intel XE#2136])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     ([SKIP][621], [SKIP][622]) ([Intel XE#2136] / [Intel XE#776]) -> [SKIP][623] ([Intel XE#2136])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          ([SKIP][624], [SKIP][625]) ([Intel XE#2372] / [Intel XE#2423]) -> [SKIP][626] ([Intel XE#2372])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_feature_discovery@chamelium.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          ([SKIP][627], [SKIP][628]) ([Intel XE#2373] / [Intel XE#2423]) -> [SKIP][629] ([Intel XE#2423])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          ([SKIP][630], [SKIP][631]) ([Intel XE#2373]) -> [SKIP][632] ([Intel XE#2423])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_feature_discovery@display-3x.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          ([SKIP][633], [SKIP][634]) ([Intel XE#2374] / [Intel XE#2423]) -> [SKIP][635] ([Intel XE#2374])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_feature_discovery@psr1.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_feature_discovery@psr1.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     ([SKIP][636], [SKIP][637]) ([Intel XE#1135] / [Intel XE#2423] / [i915#2575]) -> [SKIP][638] ([Intel XE#2423] / [i915#2575])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_feature_discovery@psr1.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_feature_discovery@psr1.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-bmg:          ([PASS][639], [SKIP][640]) ([Intel XE#2423]) -> [SKIP][641] ([Intel XE#2316])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          ([DMESG-WARN][642], [SKIP][643]) ([Intel XE#2423] / [Intel XE#3468]) -> [DMESG-WARN][644] ([Intel XE#3468])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          ([PASS][645], [SKIP][646]) ([Intel XE#2423]) -> [FAIL][647] ([Intel XE#2882])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][648] ([Intel XE#2423]) -> [SKIP][649] ([Intel XE#2316])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          ([SKIP][650], [SKIP][651]) ([Intel XE#2316] / [Intel XE#2423]) -> [SKIP][652] ([Intel XE#2423]) +4 other tests skip
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          ([SKIP][653], [DMESG-WARN][654]) ([Intel XE#2423] / [Intel XE#3468]) -> [SKIP][655] ([Intel XE#2316])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          ([PASS][656], [SKIP][657]) ([Intel XE#2316]) -> [SKIP][658] ([Intel XE#2423])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     ([SKIP][659], [DMESG-WARN][660]) ([Intel XE#1727] / [Intel XE#2423] / [i915#2575]) -> [SKIP][661] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          ([SKIP][662], [SKIP][663]) ([Intel XE#2136] / [Intel XE#2293] / [Intel XE#2380]) -> [SKIP][664] ([Intel XE#2136]) +2 other tests skip
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     ([SKIP][665], [SKIP][666]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#455]) -> [SKIP][667] ([Intel XE#2136] / [Intel XE#2351])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     ([SKIP][668], [SKIP][669]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#455]) -> [SKIP][670] ([Intel XE#455])
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     ([SKIP][671], [SKIP][672]) ([Intel XE#2136] / [Intel XE#455]) -> [SKIP][673] ([Intel XE#2136]) +3 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][674] ([Intel XE#2136]) -> [SKIP][675] ([Intel XE#2380])
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][676] ([Intel XE#2136]) -> [SKIP][677] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          ([SKIP][678], [SKIP][679]) ([Intel XE#2136] / [Intel XE#2293] / [Intel XE#2380]) -> [SKIP][680] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          ([SKIP][681], [SKIP][682]) ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][683] ([Intel XE#2136]) +2 other tests skip
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][684] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][685] ([Intel XE#2136]) +2 other tests skip
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     ([SKIP][686], [SKIP][687]) ([Intel XE#2423] / [i915#2575] / [i915#5274]) -> [SKIP][688] ([Intel XE#2423] / [i915#2575])
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          ([SKIP][689], [SKIP][690]) ([Intel XE#2311] / [Intel XE#2312]) -> [SKIP][691] ([Intel XE#2136]) +8 other tests skip
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          ([SKIP][692], [SKIP][693]) ([Intel XE#2136] / [Intel XE#2311]) -> [SKIP][694] ([Intel XE#2311]) +38 other tests skip
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     ([SKIP][695], [SKIP][696]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#651]) -> [SKIP][697] ([Intel XE#651]) +6 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][698] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][699] ([Intel XE#651]) +4 other tests skip
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][700] ([Intel XE#2311]) -> [SKIP][701] ([Intel XE#2136]) +9 other tests skip
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          ([SKIP][702], [SKIP][703]) ([Intel XE#2311]) -> [SKIP][704] ([Intel XE#2136]) +12 other tests skip
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     ([SKIP][705], [SKIP][706]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#651]) -> [SKIP][707] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          ([FAIL][708], [FAIL][709]) ([Intel XE#2333]) -> [SKIP][710] ([Intel XE#2136]) +5 other tests skip
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          ([SKIP][711], [FAIL][712]) ([Intel XE#2136] / [Intel XE#2333]) -> [SKIP][713] ([Intel XE#2136]) +6 other tests skip
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          ([FAIL][714], [SKIP][715]) ([Intel XE#2136] / [Intel XE#2333]) -> [FAIL][716] ([Intel XE#2333]) +14 other tests fail
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
    - shard-dg2-set2:     ([SKIP][717], [INCOMPLETE][718]) ([Intel XE#1727] / [Intel XE#2136] / [Intel XE#2351]) -> [SKIP][719] ([Intel XE#2136] / [Intel XE#2351])
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          ([FAIL][720], [DMESG-FAIL][721]) ([Intel XE#2333] / [Intel XE#3468]) -> [SKIP][722] ([Intel XE#2136])
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          ([FAIL][723], [DMESG-FAIL][724]) ([Intel XE#2333] / [Intel XE#3468]) -> [FAIL][725] ([Intel XE#2333]) +1 other test fail
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          ([FAIL][726], [SKIP][727]) ([Intel XE#2312] / [Intel XE#2333]) -> [FAIL][728] ([Intel XE#2333])
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][729] ([Intel XE#2333]) -> [SKIP][730] ([Intel XE#2312])
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          ([FAIL][731], [SKIP][732]) ([Intel XE#2136] / [Intel XE#2333]) -> [SKIP][733] ([Intel XE#2312]) +3 other tests skip
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][734] ([Intel XE#2136]) -> [FAIL][735] ([Intel XE#2333]) +6 other tests fail
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          ([SKIP][736], [DMESG-FAIL][737]) ([Intel XE#2136] / [Intel XE#3468]) -> [DMESG-FAIL][738] ([Intel XE#3468])
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          ([FAIL][739], [SKIP][740]) ([Intel XE#2312] / [Intel XE#2333]) -> [SKIP][741] ([Intel XE#2136]) +3 other tests skip
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [FAIL][742] ([Intel XE#2333]) -> [SKIP][743] ([Intel XE#2136]) +3 other tests skip
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          ([SKIP][744], [SKIP][745]) ([Intel XE#2352]) -> [SKIP][746] ([Intel XE#2136])
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     ([SKIP][747], [SKIP][748]) ([Intel XE#2136] / [Intel XE#651]) -> [SKIP][749] ([Intel XE#2136]) +13 other tests skip
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          ([SKIP][750], [SKIP][751]) ([Intel XE#2136] / [Intel XE#2311]) -> [SKIP][752] ([Intel XE#2136]) +21 other tests skip
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][753] ([Intel XE#2136]) -> [SKIP][754] ([Intel XE#651]) +4 other tests skip
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          ([SKIP][755], [SKIP][756]) ([Intel XE#2136] / [Intel XE#2311]) -> [SKIP][757] ([Intel XE#2312]) +3 other tests skip
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][758] ([Intel XE#2311]) -> [SKIP][759] ([Intel XE#2312]) +4 other tests skip
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          ([SKIP][760], [SKIP][761]) ([Intel XE#2136] / [Intel XE#2312]) -> [SKIP][762] ([Intel XE#2136]) +8 other tests skip
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][763] ([Intel XE#2136]) -> [SKIP][764] ([Intel XE#2311]) +15 other tests skip
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     ([SKIP][765], [SKIP][766]) ([Intel XE#2136] / [Intel XE#651]) -> [SKIP][767] ([Intel XE#651]) +7 other tests skip
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          ([SKIP][768], [SKIP][769]) ([Intel XE#2136] / [Intel XE#2352]) -> [SKIP][770] ([Intel XE#2136]) +1 other test skip
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][771] ([Intel XE#2136]) -> [SKIP][772] ([Intel XE#653]) +6 other tests skip
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][773] ([Intel XE#2313]) -> [SKIP][774] ([Intel XE#2136]) +10 other tests skip
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     ([SKIP][775], [SKIP][776]) ([Intel XE#2136] / [Intel XE#653]) -> [SKIP][777] ([Intel XE#2136]) +10 other tests skip
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][778] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][779] ([Intel XE#653]) +3 other tests skip
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][780] ([Intel XE#2136]) -> [SKIP][781] ([Intel XE#2313]) +15 other tests skip
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2-set2:     ([SKIP][782], [SKIP][783]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#653]) -> [SKIP][784] ([Intel XE#653]) +3 other tests skip
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-bmg:          ([SKIP][785], [SKIP][786]) ([Intel XE#2136] / [Intel XE#2313]) -> [SKIP][787] ([Intel XE#2136]) +20 other tests skip
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          ([SKIP][788], [SKIP][789]) ([Intel XE#2313]) -> [SKIP][790] ([Intel XE#2136]) +14 other tests skip
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     ([SKIP][791], [SKIP][792]) ([Intel XE#1158] / [Intel XE#2136]) -> [SKIP][793] ([Intel XE#1158])
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          ([SKIP][794], [SKIP][795]) ([Intel XE#2136] / [Intel XE#2350]) -> [SKIP][796] ([Intel XE#2136])
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     ([SKIP][797], [SKIP][798]) ([Intel XE#2136] / [Intel XE#653]) -> [SKIP][799] ([Intel XE#653]) +9 other tests skip
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][800] ([Intel XE#2313]) -> [SKIP][801] ([Intel XE#2312]) +4 other tests skip
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          ([SKIP][802], [SKIP][803]) ([Intel XE#2136] / [Intel XE#2313]) -> [SKIP][804] ([Intel XE#2313]) +38 other tests skip
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     ([SKIP][805], [SKIP][806]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#653]) -> [SKIP][807] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          ([SKIP][808], [SKIP][809]) ([Intel XE#2136] / [Intel XE#2313]) -> [SKIP][810] ([Intel XE#2312]) +3 other tests skip
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          ([SKIP][811], [SKIP][812]) ([Intel XE#2312] / [Intel XE#2313]) -> [SKIP][813] ([Intel XE#2136]) +5 other tests skip
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][814] ([Intel XE#2136]) -> [SKIP][815] ([Intel XE#2312]) +12 other tests skip
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          ([SKIP][816], [SKIP][817]) ([Intel XE#2423] / [Intel XE#2502]) -> [SKIP][818] ([Intel XE#2502])
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          ([SKIP][819], [SKIP][820]) ([Intel XE#2340]) -> [SKIP][821] ([Intel XE#2423])
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][822] ([Intel XE#2423]) -> [SKIP][823] ([Intel XE#3544])
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][824] ([Intel XE#2423] / [i915#2575]) -> [SKIP][825] ([Intel XE#455]) +1 other test skip
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          ([SKIP][826], [SKIP][827]) ([Intel XE#2136] / [Intel XE#346]) -> [SKIP][828] ([Intel XE#346])
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          ([SKIP][829], [DMESG-WARN][830]) ([Intel XE#2136] / [Intel XE#3468]) -> [SKIP][831] ([Intel XE#3012])
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          ([SKIP][832], [SKIP][833]) ([Intel XE#2136] / [Intel XE#2934]) -> [SKIP][834] ([Intel XE#2136])
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     ([SKIP][835], [SKIP][836]) ([Intel XE#2136] / [Intel XE#346]) -> [SKIP][837] ([Intel XE#2136])
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          ([SKIP][838], [SKIP][839]) ([Intel XE#2136] / [Intel XE#2934]) -> [SKIP][840] ([Intel XE#2934])
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][841] ([Intel XE#2136]) -> [SKIP][842] ([Intel XE#2925])
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     ([SKIP][843], [SKIP][844]) ([Intel XE#2136] / [Intel XE#2927]) -> [SKIP][845] ([Intel XE#2927])
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-bmg:          ([SKIP][846], [SKIP][847]) ([Intel XE#2136] / [Intel XE#2927]) -> [SKIP][848] ([Intel XE#2136])
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          ([SKIP][849], [SKIP][850]) ([Intel XE#2423] / [Intel XE#2486]) -> [SKIP][851] ([Intel XE#2486])
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     ([SKIP][852], [INCOMPLETE][853]) ([Intel XE#1035] / [Intel XE#2423] / [Intel XE#3468] / [i915#2575]) -> [SKIP][854] ([Intel XE#2423] / [i915#2575])
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     ([FAIL][855], [SKIP][856]) ([Intel XE#2423] / [Intel XE#616] / [i915#2575]) -> [SKIP][857] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_plane_cursor@overlay.html
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_plane_cursor@overlay.html
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][858] ([Intel XE#2393]) -> [SKIP][859] ([Intel XE#2423])
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          ([SKIP][860], [SKIP][861]) ([Intel XE#2393] / [Intel XE#2423]) -> [SKIP][862] ([Intel XE#2393])
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          ([SKIP][863], [SKIP][864]) ([Intel XE#2423] / [Intel XE#2493]) -> [SKIP][865] ([Intel XE#2493])
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html
   [865]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][866] ([Intel XE#2423]) -> [SKIP][867] ([Intel XE#2763]) +2 other tests skip
   [866]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [867]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     ([SKIP][868], [SKIP][869]) ([Intel XE#2423] / [Intel XE#2763] / [Intel XE#455] / [i915#2575]) -> [SKIP][870] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [868]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [869]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [870]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-bmg:          ([SKIP][871], [SKIP][872]) ([Intel XE#2763]) -> [SKIP][873] ([Intel XE#2423]) +1 other test skip
   [871]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [872]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [873]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          ([SKIP][874], [SKIP][875]) ([Intel XE#2423] / [Intel XE#2763]) -> [SKIP][876] ([Intel XE#2423])
   [874]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [875]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [876]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-bmg:          ([SKIP][877], [SKIP][878]) ([Intel XE#2423] / [Intel XE#2763]) -> [SKIP][879] ([Intel XE#2763]) +2 other tests skip
   [877]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [878]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [879]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          ([SKIP][880], [SKIP][881]) ([Intel XE#2136] / [Intel XE#870]) -> [SKIP][882] ([Intel XE#870]) +1 other test skip
   [880]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html
   [881]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html
   [882]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][883] ([Intel XE#2136]) -> [SKIP][884] ([Intel XE#870])
   [883]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html
   [884]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          ([SKIP][885], [SKIP][886]) ([Intel XE#2136] / [Intel XE#870]) -> [SKIP][887] ([Intel XE#2136])
   [885]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_backlight@fade.html
   [886]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_pm_backlight@fade.html
   [887]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          ([SKIP][888], [SKIP][889]) ([Intel XE#870]) -> [SKIP][890] ([Intel XE#2136])
   [888]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html
   [889]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html
   [890]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     ([SKIP][891], [SKIP][892]) ([Intel XE#1122] / [Intel XE#2136] / [Intel XE#2351]) -> [SKIP][893] ([Intel XE#2136] / [Intel XE#2351])
   [891]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [892]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [893]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     ([SKIP][894], [SKIP][895]) ([Intel XE#1129] / [Intel XE#2136]) -> [SKIP][896] ([Intel XE#2136])
   [894]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [895]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [896]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
    - shard-bmg:          ([SKIP][897], [SKIP][898]) ([Intel XE#2392]) -> [SKIP][899] ([Intel XE#2136])
   [897]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
   [898]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html
   [899]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     ([SKIP][900], [SKIP][901]) ([Intel XE#2136] / [Intel XE#3309]) -> [SKIP][902] ([Intel XE#2136])
   [900]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
   [901]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
   [902]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          ([SKIP][903], [SKIP][904]) ([Intel XE#2136] / [Intel XE#3309]) -> [SKIP][905] ([Intel XE#3309])
   [903]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html
   [904]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html
   [905]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     ([SKIP][906], [SKIP][907]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#908]) -> [SKIP][908] ([Intel XE#908])
   [906]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
   [907]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
   [908]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
    - shard-bmg:          ([SKIP][909], [FAIL][910]) ([Intel XE#1430] / [Intel XE#2136]) -> [SKIP][911] ([Intel XE#2136])
   [909]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html
   [910]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_pm_dc@dc6-dpms.html
   [911]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         ([SKIP][912], [FAIL][913]) ([Intel XE#3325] / [Intel XE#734]) -> [FAIL][914] ([Intel XE#3325])
   [912]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
   [913]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [914]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][915] ([Intel XE#2446]) -> [SKIP][916] ([Intel XE#1439])
   [915]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [916]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          ([SKIP][917], [SKIP][918]) ([Intel XE#1439] / [Intel XE#2446] / [Intel XE#3141]) -> [SKIP][919] ([Intel XE#2446])
   [917]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html
   [918]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html
   [919]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][920] ([Intel XE#2446]) -> [SKIP][921] ([Intel XE#1439] / [Intel XE#3141])
   [920]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [921]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][922] ([Intel XE#2446]) -> [ABORT][923] ([Intel XE#3468])
   [922]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html
   [923]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          ([PASS][924], [SKIP][925]) ([Intel XE#2446]) -> [SKIP][926] ([Intel XE#2446]) +1 other test skip
   [924]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [925]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [926]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          ([INCOMPLETE][927], [PASS][928]) ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468]) -> [SKIP][929] ([Intel XE#2446])
   [927]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [928]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [929]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     ([SKIP][930], [PASS][931]) ([Intel XE#2446]) -> [SKIP][932] ([Intel XE#2446]) +1 other test skip
   [930]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html
   [931]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_pm_rpm@universal-planes-dpms.html
   [932]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          ([SKIP][933], [SKIP][934]) ([Intel XE#1489]) -> [SKIP][935] ([Intel XE#2136]) +7 other tests skip
   [933]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [934]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [935]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][936] ([Intel XE#2136]) -> [SKIP][937] ([Intel XE#1489]) +1 other test skip
   [936]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
   [937]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          ([SKIP][938], [SKIP][939]) ([Intel XE#1489] / [Intel XE#2136]) -> [SKIP][940] ([Intel XE#2136]) +5 other tests skip
   [938]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [939]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [940]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     ([SKIP][941], [SKIP][942]) ([Intel XE#1489] / [Intel XE#2136]) -> [SKIP][943] ([Intel XE#1489]) +3 other tests skip
   [941]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [942]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [943]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     ([SKIP][944], [SKIP][945]) ([Intel XE#1489] / [Intel XE#2136]) -> [SKIP][946] ([Intel XE#2136]) +7 other tests skip
   [944]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [945]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [946]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][947] ([Intel XE#2136]) -> [SKIP][948] ([Intel XE#1489]) +3 other tests skip
   [947]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [948]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          ([SKIP][949], [SKIP][950]) ([Intel XE#1489] / [Intel XE#2136]) -> [SKIP][951] ([Intel XE#1489]) +9 other tests skip
   [949]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [950]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [951]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][952] ([Intel XE#1489]) -> [SKIP][953] ([Intel XE#2136]) +2 other tests skip
   [952]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [953]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          ([SKIP][954], [SKIP][955]) ([Intel XE#2136] / [Intel XE#2387]) -> [SKIP][956] ([Intel XE#2387])
   [954]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [955]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [956]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     [SKIP][957] ([Intel XE#2136]) -> [SKIP][958] ([Intel XE#1122])
   [957]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [958]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          ([SKIP][959], [SKIP][960]) ([Intel XE#2136] / [Intel XE#2387]) -> [SKIP][961] ([Intel XE#2136])
   [959]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html
   [960]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_psr2_su@page_flip-nv12.html
   [961]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][962] ([Intel XE#2136]) -> [SKIP][963] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [962]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html
   [963]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     ([SKIP][964], [SKIP][965]) ([Intel XE#2136] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][966] ([Intel XE#2136]) +5 other tests skip
   [964]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [965]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [966]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     ([SKIP][967], [SKIP][968]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][969] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [967]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html
   [968]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_psr@fbc-pr-no-drrs.html
   [969]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-bmg:          [SKIP][970] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][971] ([Intel XE#2136]) +5 other tests skip
   [970]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_psr@fbc-psr-dpms.html
   [971]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     ([SKIP][972], [SKIP][973]) ([Intel XE#2136] / [Intel XE#2351] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][974] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [972]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
   [973]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html
   [974]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-bmg:          ([SKIP][975], [SKIP][976]) ([Intel XE#2136] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][977] ([Intel XE#2234] / [Intel XE#2850]) +21 other tests skip
   [975]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-render.html
   [976]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-render.html
   [977]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-render.html
    - shard-dg2-set2:     ([SKIP][978], [SKIP][979]) ([Intel XE#2136] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][980] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [978]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-render.html
   [979]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-render.html
   [980]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][981] ([Intel XE#2136]) -> [SKIP][982] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [981]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html
   [982]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-cursor-render:
    - shard-bmg:          ([SKIP][983], [SKIP][984]) ([Intel XE#2136] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][985] ([Intel XE#2136]) +13 other tests skip
   [983]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_psr@pr-cursor-render.html
   [984]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr@pr-cursor-render.html
   [985]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          ([SKIP][986], [SKIP][987]) ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][988] ([Intel XE#2136]) +9 other tests skip
   [986]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_psr@psr-basic.html
   [987]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_psr@psr-basic.html
   [988]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     ([SKIP][989], [SKIP][990]) ([Intel XE#2351] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][991] ([Intel XE#2351])
   [989]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_psr@psr-cursor-plane-move.html
   [990]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html
   [991]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          ([SKIP][992], [SKIP][993]) ([Intel XE#2136] / [Intel XE#2414]) -> [SKIP][994] ([Intel XE#2414])
   [992]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [993]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [994]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][995] ([Intel XE#3414]) -> [SKIP][996] ([Intel XE#2423])
   [995]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [996]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][997] ([Intel XE#2423]) -> [SKIP][998] ([Intel XE#3414])
   [997]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [998]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     ([SKIP][999], [SKIP][1000]) ([Intel XE#1127] / [Intel XE#2423] / [i915#2575]) -> [SKIP][1001] ([Intel XE#1127])
   [999]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [1000]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [1001]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-bmg:          ([SKIP][1002], [SKIP][1003]) ([Intel XE#2330] / [Intel XE#2423]) -> [SKIP][1004] ([Intel XE#2423]) +1 other test skip
   [1002]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [1003]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [1004]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][1005] ([Intel XE#2423] / [i915#2575]) -> [SKIP][1006] ([Intel XE#3414])
   [1005]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html
   [1006]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html
    - shard-bmg:          ([SKIP][1007], [SKIP][1008]) ([Intel XE#2423] / [Intel XE#3414]) -> [SKIP][1009] ([Intel XE#3414])
   [1007]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-270.html
   [1008]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-270.html
   [1009]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          ([SKIP][1010], [SKIP][1011]) ([Intel XE#3414]) -> [SKIP][1012] ([Intel XE#2423]) +2 other tests skip
   [1010]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html
   [1011]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
   [1012]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-dg2-set2:     ([SKIP][1013], [SKIP][1014]) ([Intel XE#2423] / [Intel XE#3414] / [i915#2575]) -> [SKIP][1015] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [1013]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html
   [1014]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html
   [1015]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          ([SKIP][1016], [SKIP][1017]) ([Intel XE#2423] / [Intel XE#3414]) -> [SKIP][1018] ([Intel XE#2423]) +1 other test skip
   [1016]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [1017]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [1018]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          ([SKIP][1019], [SKIP][1020]) ([Intel XE#2413] / [Intel XE#2423]) -> [SKIP][1021] ([Intel XE#2413])
   [1019]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html
   [1020]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html
   [1021]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     ([SKIP][1022], [SKIP][1023]) ([Intel XE#2423] / [Intel XE#455] / [i915#2575]) -> [SKIP][1024] ([Intel XE#455]) +3 other tests skip
   [1022]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [1023]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [1024]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_scaling_modes@scaling-mode-full-aspect.html
    - shard-bmg:          ([SKIP][1025], [SKIP][1026]) ([Intel XE#2413] / [Intel XE#2423]) -> [SKIP][1027] ([Intel XE#2423])
   [1025]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [1026]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [1027]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          ([SKIP][1028], [SKIP][1029]) ([Intel XE#2413]) -> [SKIP][1030] ([Intel XE#2423])
   [1028]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-none.html
   [1029]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html
   [1030]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          ([SKIP][1031], [SKIP][1032]) ([Intel XE#1435] / [Intel XE#2423]) -> [SKIP][1033] ([Intel XE#2423]) +1 other test skip
   [1031]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_setmode@basic-clone-single-crtc.html
   [1032]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html
   [1033]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          ([SKIP][1034], [SKIP][1035]) ([Intel XE#2423] / [Intel XE#2426]) -> [SKIP][1036] ([Intel XE#2426]) +1 other test skip
   [1034]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [1035]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [1036]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     ([FAIL][1037], [SKIP][1038]) ([Intel XE#1729] / [Intel XE#2423] / [i915#2575]) -> [FAIL][1039] ([Intel XE#1729])
   [1037]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [1038]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [1039]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     ([SKIP][1040], [SKIP][1041]) ([Intel XE#1500] / [Intel XE#2423] / [i915#2575]) -> [SKIP][1042] ([Intel XE#2423] / [i915#2575])
   [1040]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [1041]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [1042]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          ([PASS][1043], [FAIL][1044]) ([Intel XE#899]) -> [FAIL][1045] ([Intel XE#899])
   [1043]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [1044]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html
   [1045]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@query-idle:
    - shard-bmg:          [DMESG-FAIL][1046] ([Intel XE#3468]) -> [DMESG-WARN][1047] ([Intel XE#3468])
   [1046]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_vblank@query-idle.html
   [1047]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_vblank@query-idle.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          ([SKIP][1048], [SKIP][1049]) ([Intel XE#1499]) -> [SKIP][1050] ([Intel XE#2423]) +1 other test skip
   [1048]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_vrr@flip-basic.html
   [1049]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_vrr@flip-basic.html
   [1050]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][1051] ([Intel XE#2423]) -> [SKIP][1052] ([Intel XE#1499])
   [1051]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_vrr@flip-suspend.html
   [1052]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          ([SKIP][1053], [SKIP][1054]) ([Intel XE#1499] / [Intel XE#2423]) -> [SKIP][1055] ([Intel XE#1499]) +2 other tests skip
   [1053]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_vrr@flipline.html
   [1054]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_vrr@flipline.html
   [1055]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][1056] ([Intel XE#1499]) -> [SKIP][1057] ([Intel XE#2423])
   [1056]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_vrr@max-min.html
   [1057]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          ([SKIP][1058], [SKIP][1059]) ([Intel XE#2423] / [Intel XE#756]) -> [SKIP][1060] ([Intel XE#756]) +1 other test skip
   [1058]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [1059]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [1060]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][1061] ([Intel XE#2423] / [i915#2575]) -> [SKIP][1062] ([Intel XE#756])
   [1061]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
   [1062]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          ([SKIP][1063], [SKIP][1064]) ([Intel XE#2423] / [Intel XE#756]) -> [SKIP][1065] ([Intel XE#2423])
   [1063]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html
   [1064]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html
   [1065]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          ([SKIP][1066], [SKIP][1067]) ([Intel XE#756]) -> [SKIP][1068] ([Intel XE#2423])
   [1066]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html
   [1067]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_writeback@writeback-pixel-formats.html
   [1068]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          ([SKIP][1069], [SKIP][1070]) ([Intel XE#1091] / [Intel XE#2423] / [Intel XE#2849]) -> [SKIP][1071] ([Intel XE#1091] / [Intel XE#2849])
   [1069]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [1070]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [1071]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          ([SKIP][1072], [SKIP][1073]) ([Intel XE#1091] / [Intel XE#2423] / [Intel XE#2849]) -> [SKIP][1074] ([Intel XE#2423])
   [1072]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [1073]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [1074]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [INCOMPLETE][1075] -> [SKIP][1076] ([Intel XE#1130])
   [1075]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_ccs@suspend-resume.html
   [1076]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     ([SKIP][1077], [SKIP][1078]) ([Intel XE#1130] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][1079] ([Intel XE#1130])
   [1077]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [1078]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
   [1079]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     ([SKIP][1080], [SKIP][1081]) ([Intel XE#1123] / [Intel XE#1130]) -> [SKIP][1082] ([Intel XE#1123])
   [1080]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [1081]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [1082]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-bmg:          ([PASS][1083], [SKIP][1084]) ([Intel XE#1130]) -> [SKIP][1085] ([Intel XE#1130]) +139 other tests skip
   [1083]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_copy_basic@mem-set-linear-0x369.html
   [1084]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_copy_basic@mem-set-linear-0x369.html
   [1085]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_copy_basic@mem-set-linear-0x369.html
    - shard-dg2-set2:     ([SKIP][1086], [SKIP][1087]) ([Intel XE#1126] / [Intel XE#1130]) -> [SKIP][1088] ([Intel XE#1126])
   [1086]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html
   [1087]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html
   [1088]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     ([SKIP][1089], [SKIP][1090]) ([Intel XE#1126] / [Intel XE#1130]) -> [SKIP][1091] ([Intel XE#1130])
   [1089]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [1090]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [1091]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][1092] ([Intel XE#1130]) -> [SKIP][1093] ([Intel XE#1126])
   [1092]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [1093]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          ([SKIP][1094], [SKIP][1095]) ([Intel XE#1130] / [Intel XE#2504]) -> [SKIP][1096] ([Intel XE#2504])
   [1094]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html
   [1095]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html
   [1096]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_drm_fdinfo@utilization-single-idle:
    - shard-bmg:          [DMESG-WARN][1097] ([Intel XE#3468]) -> [DMESG-WARN][1098] ([Intel XE#1727])
   [1097]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_drm_fdinfo@utilization-single-idle.html
   [1098]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-idle.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-dg2-set2:     ([SKIP][1099], [SKIP][1100]) ([Intel XE#1130] / [Intel XE#2905]) -> [SKIP][1101] ([Intel XE#2905]) +5 other tests skip
   [1099]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_eudebug@basic-vm-access.html
   [1100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_eudebug@basic-vm-access.html
   [1101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          ([SKIP][1102], [SKIP][1103]) ([Intel XE#1130] / [Intel XE#2905]) -> [SKIP][1104] ([Intel XE#1130]) +7 other tests skip
   [1102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_eudebug@basic-vm-access-userptr.html
   [1103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html
   [1104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          ([SKIP][1105], [SKIP][1106]) ([Intel XE#2905]) -> [SKIP][1107] ([Intel XE#1130]) +5 other tests skip
   [1105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_eudebug@vm-bind-clear.html
   [1106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_eudebug@vm-bind-clear.html
   [1107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          ([SKIP][1108], [SKIP][1109]) ([Intel XE#1130] / [Intel XE#2905]) -> [SKIP][1110] ([Intel XE#2905]) +14 other tests skip
   [1108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [1109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [1110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-dg2-set2:     [SKIP][1111] ([Intel XE#1130]) -> [SKIP][1112] ([Intel XE#2905]) +1 other test skip
   [1111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_eudebug_online@pagefault-read.html
   [1112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          [SKIP][1113] ([Intel XE#2905]) -> [SKIP][1114] ([Intel XE#1130]) +5 other tests skip
   [1113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_eudebug_online@pagefault-write.html
   [1114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][1115] ([Intel XE#1130]) -> [SKIP][1116] ([Intel XE#2905]) +7 other tests skip
   [1115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html
   [1116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     ([FAIL][1117], [SKIP][1118]) ([Intel XE#1130] / [Intel XE#1600]) -> [SKIP][1119] ([Intel XE#1130])
   [1117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [1118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [1119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
    - shard-bmg:          ([FAIL][1120], [FAIL][1121]) ([Intel XE#2364]) -> [SKIP][1122] ([Intel XE#1130])
   [1120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [1121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [1122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          ([TIMEOUT][1123], [SKIP][1124]) ([Intel XE#1130] / [Intel XE#1473]) -> [SKIP][1125] ([Intel XE#1130])
   [1123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [1124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [1125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][1126] ([Intel XE#1130]) -> [TIMEOUT][1127] ([Intel XE#1473] / [Intel XE#402])
   [1126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [1127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          ([FAIL][1128], [SKIP][1129]) ([Intel XE#1130] / [Intel XE#2364]) -> [FAIL][1130] ([Intel XE#2364])
   [1128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_evict@evict-large-multi-vm-cm.html
   [1129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html
   [1130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     ([INCOMPLETE][1131], [SKIP][1132]) ([Intel XE#1130] / [Intel XE#1473]) -> [SKIP][1133] ([Intel XE#1130])
   [1131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
   [1132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [1133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          ([SKIP][1134], [SKIP][1135]) ([Intel XE#1130] / [Intel XE#2322]) -> [SKIP][1136] ([Intel XE#2322]) +10 other tests skip
   [1134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [1135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [1136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          ([SKIP][1137], [SKIP][1138]) ([Intel XE#1130] / [Intel XE#2322]) -> [SKIP][1139] ([Intel XE#1130]) +8 other tests skip
   [1137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [1138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [1139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][1140] ([Intel XE#2322]) -> [SKIP][1141] ([Intel XE#1130]) +1 other test skip
   [1140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [1141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][1142] ([Intel XE#1130]) -> [SKIP][1143] ([Intel XE#2322]) +4 other tests skip
   [1142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [1143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          ([SKIP][1144], [SKIP][1145]) ([Intel XE#2322]) -> [SKIP][1146] ([Intel XE#1130]) +7 other tests skip
   [1144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [1145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [1146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@once-bindexecqueue:
    - shard-bmg:          ([PASS][1147], [DMESG-WARN][1148]) ([Intel XE#1727]) -> [SKIP][1149] ([Intel XE#1130]) +2 other tests skip
   [1147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_exec_basic@once-bindexecqueue.html
   [1148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_exec_basic@once-bindexecqueue.html
   [1149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-bmg:          ([DMESG-WARN][1150], [SKIP][1151]) ([Intel XE#1130] / [Intel XE#3468]) -> [DMESG-WARN][1152] ([Intel XE#3468]) +1 other test dmesg-warn
   [1150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [1151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [1152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][1153] ([Intel XE#1130]) -> [DMESG-WARN][1154] ([Intel XE#3468]) +2 other tests dmesg-warn
   [1153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm.html
   [1154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     ([SKIP][1155], [SKIP][1156]) ([Intel XE#1130] / [Intel XE#288]) -> [SKIP][1157] ([Intel XE#1130]) +24 other tests skip
   [1155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [1156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [1157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     ([SKIP][1158], [SKIP][1159]) ([Intel XE#1130] / [Intel XE#288]) -> [SKIP][1160] ([Intel XE#288]) +9 other tests skip
   [1158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
   [1159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
   [1160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][1161] ([Intel XE#1130]) -> [SKIP][1162] ([Intel XE#288]) +7 other tests skip
   [1161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [1162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     ([SKIP][1163], [SKIP][1164]) ([Intel XE#1130] / [Intel XE#2360]) -> [SKIP][1165] ([Intel XE#1130])
   [1163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [1164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [1165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     ([SKIP][1166], [SKIP][1167]) ([Intel XE#1130] / [Intel XE#2905]) -> [SKIP][1168] ([Intel XE#1130]) +7 other tests skip
   [1166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [1167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [1168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-rebind:
    - shard-dg2-set2:     ([SKIP][1169], [DMESG-WARN][1170]) ([Intel XE#1130] / [Intel XE#1727]) -> [SKIP][1171] ([Intel XE#1130]) +3 other tests skip
   [1169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html
   [1170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html
   [1171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-dg2-set2:     ([DMESG-WARN][1172], [SKIP][1173]) ([Intel XE#1130] / [Intel XE#3343]) -> [DMESG-WARN][1174] ([Intel XE#3343])
   [1172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [1173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [1174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          ([DMESG-WARN][1175], [SKIP][1176]) ([Intel XE#1130] / [Intel XE#3467]) -> [DMESG-WARN][1177] ([Intel XE#3467])
   [1175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [1176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [1177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-dg2-set2:     ([DMESG-WARN][1178], [SKIP][1179]) ([Intel XE#1130] / [Intel XE#3343]) -> [SKIP][1180] ([Intel XE#1130])
   [1178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [1179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [1180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [SKIP][1181] ([Intel XE#1130]) -> [DMESG-WARN][1182] ([Intel XE#3343])
   [1181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [1182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          ([DMESG-FAIL][1183], [SKIP][1184]) ([Intel XE#1130] / [Intel XE#3467]) -> [SKIP][1185] ([Intel XE#1130])
   [1183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [1184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [1185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          ([FAIL][1186], [FAIL][1187]) ([Intel XE#3499]) -> [SKIP][1188] ([Intel XE#1130])
   [1186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [1187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [1188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [FAIL][1189] ([Intel XE#3499]) -> [SKIP][1190] ([Intel XE#1130])
   [1189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [1190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [SKIP][1191] ([Intel XE#1130]) -> [DMESG-FAIL][1192] ([Intel XE#3467])
   [1191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [1192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          ([FAIL][1193], [DMESG-FAIL][1194]) ([Intel XE#3467] / [Intel XE#3468] / [Intel XE#3499]) -> [FAIL][1195] ([Intel XE#3499])
   [1193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [1194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [1195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-dg2-set2:     ([SKIP][1196], [DMESG-WARN][1197]) ([Intel XE#1130] / [Intel XE#3467]) -> [SKIP][1198] ([Intel XE#1130]) +2 other tests skip
   [1196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [1197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [1198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][1199] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][1200] ([Intel XE#3467])
   [1199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [1200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-dg2-set2:     ([DMESG-FAIL][1201], [SKIP][1202]) ([Intel XE#1130] / [Intel XE#1727] / [Intel XE#3468]) -> [SKIP][1203] ([Intel XE#1130])
   [1201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_gt_freq@freq_suspend.html
   [1202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_gt_freq@freq_suspend.html
   [1203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          ([SKIP][1204], [PASS][1205]) ([Intel XE#2229]) -> [SKIP][1206] ([Intel XE#2229])
   [1204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [1205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [1206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          ([SKIP][1207], [SKIP][1208]) ([Intel XE#1130] / [Intel XE#2459] / [Intel XE#2596]) -> [SKIP][1209] ([Intel XE#2459] / [Intel XE#2596])
   [1207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_media_fill@media-fill.html
   [1208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_media_fill@media-fill.html
   [1209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          ([SKIP][1210], [SKIP][1211]) ([Intel XE#586]) -> [SKIP][1212] ([Intel XE#1130])
   [1210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_mmap@small-bar.html
   [1211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_mmap@small-bar.html
   [1212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     ([DMESG-WARN][1213], [FAIL][1214]) ([Intel XE#3467] / [Intel XE#3546]) -> [DMESG-WARN][1215] ([Intel XE#3467])
   [1213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_module_load@reload.html
   [1214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_module_load@reload.html
   [1215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_module_load@reload.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     ([SKIP][1216], [SKIP][1217]) ([Intel XE#1130] / [Intel XE#3573]) -> [SKIP][1218] ([Intel XE#3573]) +2 other tests skip
   [1216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_oa@map-oa-buffer.html
   [1217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_oa@map-oa-buffer.html
   [1218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@oa-formats:
    - shard-dg2-set2:     ([SKIP][1219], [SKIP][1220]) ([Intel XE#1130] / [Intel XE#3573]) -> [SKIP][1221] ([Intel XE#1130]) +5 other tests skip
   [1219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_oa@oa-formats.html
   [1220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_oa@oa-formats.html
   [1221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_oa@oa-formats.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          ([SKIP][1222], [SKIP][1223]) ([Intel XE#1130] / [Intel XE#2248]) -> [SKIP][1224] ([Intel XE#2248])
   [1222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
   [1223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html
   [1224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][1225] ([Intel XE#1130]) -> [SKIP][1226] ([Intel XE#3573])
   [1225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_oa@syncs-ufence-wait-cfg.html
   [1226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][1227] ([Intel XE#1130]) -> [SKIP][1228] ([Intel XE#2248])
   [1227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html
   [1228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][1229] ([Intel XE#1130]) -> [SKIP][1230] ([Intel XE#1420])
   [1229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [1230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][1231] ([Intel XE#2245]) -> [SKIP][1232] ([Intel XE#1130])
   [1231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [1232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     ([FAIL][1233], [SKIP][1234]) ([Intel XE#1061] / [Intel XE#1173]) -> [SKIP][1235] ([Intel XE#1061])
   [1233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_peer2peer@read.html
   [1234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_peer2peer@read.html
   [1235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          ([SKIP][1236], [SKIP][1237]) ([Intel XE#2284]) -> [SKIP][1238] ([Intel XE#1130])
   [1236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_pm@d3cold-basic-exec.html
   [1237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html
   [1238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          ([SKIP][1239], [SKIP][1240]) ([Intel XE#1130] / [Intel XE#2284]) -> [SKIP][1241] ([Intel XE#2284]) +2 other tests skip
   [1239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pm@d3cold-mocs.html
   [1240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_pm@d3cold-mocs.html
   [1241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][1242] ([Intel XE#1130]) -> [SKIP][1243] ([Intel XE#2284]) +1 other test skip
   [1242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html
   [1243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][1244] ([Intel XE#2284]) -> [SKIP][1245] ([Intel XE#1130])
   [1244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [1245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-dg2-set2:     ([SKIP][1246], [SKIP][1247]) ([Intel XE#1130] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][1248] ([Intel XE#1130]) +1 other test skip
   [1246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [1247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [1248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     ([DMESG-WARN][1249], [SKIP][1250]) ([Intel XE#1130] / [Intel XE#3468] / [Intel XE#569]) -> [SKIP][1251] ([Intel XE#1130])
   [1249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html
   [1250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
   [1251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     ([SKIP][1252], [DMESG-WARN][1253]) ([Intel XE#1130] / [Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [DMESG-WARN][1254] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [1252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
   [1253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
   [1254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic-exec:
    - shard-bmg:          [DMESG-WARN][1255] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][1256] ([Intel XE#3468])
   [1255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_pm@s4-basic-exec.html
   [1256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][1257] ([Intel XE#1130]) -> [DMESG-WARN][1258] ([Intel XE#3468])
   [1257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html
   [1258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          ([SKIP][1259], [DMESG-WARN][1260]) ([Intel XE#1130] / [Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][1261] ([Intel XE#1727] / [Intel XE#3468])
   [1259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pm@s4-multiple-execs.html
   [1260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_pm@s4-multiple-execs.html
   [1261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         ([PASS][1262], [ABORT][1263]) ([Intel XE#1794]) -> [ABORT][1264] ([Intel XE#1794])
   [1262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html
   [1263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [1264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     ([SKIP][1265], [SKIP][1266]) ([Intel XE#1130] / [Intel XE#579]) -> [SKIP][1267] ([Intel XE#579])
   [1265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
   [1266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
   [1267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          ([SKIP][1268], [SKIP][1269]) ([Intel XE#1130] / [Intel XE#579]) -> [SKIP][1270] ([Intel XE#1130])
   [1268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html
   [1269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [1270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     ([SKIP][1271], [DMESG-WARN][1272]) ([Intel XE#1130] / [Intel XE#1727] / [Intel XE#3468]) -> [SKIP][1273] ([Intel XE#1130]) +1 other test skip
   [1271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_pm_residency@cpg-basic.html
   [1272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_pm_residency@cpg-basic.html
   [1273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-bmg:          ([DMESG-WARN][1274], [SKIP][1275]) ([Intel XE#1130] / [Intel XE#3468]) -> [SKIP][1276] ([Intel XE#1130])
   [1274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_pm_residency@toggle-gt-c6.html
   [1275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pm_residency@toggle-gt-c6.html
   [1276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     ([SKIP][1277], [SKIP][1278]) ([Intel XE#1130] / [Intel XE#944]) -> [SKIP][1279] ([Intel XE#944])
   [1277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_query@multigpu-query-config.html
   [1278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_query@multigpu-query-config.html
   [1279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][1280] ([Intel XE#1130]) -> [SKIP][1281] ([Intel XE#944])
   [1280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_query@multigpu-query-cs-cycles.html
   [1281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     ([SKIP][1282], [SKIP][1283]) ([Intel XE#1130] / [Intel XE#944]) -> [SKIP][1284] ([Intel XE#1130]) +1 other test skip
   [1282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [1283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
   [1284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          ([SKIP][1285], [SKIP][1286]) ([Intel XE#1130] / [Intel XE#944]) -> [SKIP][1287] ([Intel XE#944]) +2 other tests skip
   [1285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html
   [1286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html
   [1287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-dg2-set2:     [SKIP][1288] ([Intel XE#1130]) -> [SKIP][1289] ([Intel XE#944])
   [1288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html
   [1289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          ([SKIP][1290], [SKIP][1291]) ([Intel XE#944]) -> [SKIP][1292] ([Intel XE#1130]) +2 other tests skip
   [1290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_query@multigpu-query-invalid-query.html
   [1291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html
   [1292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          ([SKIP][1293], [SKIP][1294]) ([Intel XE#1130] / [Intel XE#944]) -> [SKIP][1295] ([Intel XE#1130])
   [1293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_query@multigpu-query-invalid-size.html
   [1294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_query@multigpu-query-invalid-size.html
   [1295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_vm@bind-execqueues-conflict:
    - shard-bmg:          ([DMESG-WARN][1296], [SKIP][1297]) ([Intel XE#1130] / [Intel XE#1727]) -> [DMESG-WARN][1298] ([Intel XE#1727])
   [1296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_vm@bind-execqueues-conflict.html
   [1297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_vm@bind-execqueues-conflict.html
   [1298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_vm@bind-execqueues-conflict.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     ([SKIP][1299], [PASS][1300]) ([Intel XE#1130]) -> [SKIP][1301] ([Intel XE#1130]) +112 other tests skip
   [1299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [1300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [1301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          ([DMESG-WARN][1302], [DMESG-WARN][1303]) ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][1304] ([Intel XE#1130])
   [1302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html
   [1303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
   [1304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3426
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#3600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3600
  [Intel XE#3604]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3604
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a -> xe-pw-141824v1

  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a: 241f1fd26b38614aa85276a78b127e9abb14850a
  xe-pw-141824v1: 141824v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/index.html

--===============8312941046852757141==
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
<tr><td><b>Series:</b></td><td>Revert accidentally and unintentionally push=
ed</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/141824/">https://patchwork.freedesktop.org/series/141824/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2282-241f1fd26b38614aa85276a78b127e9ab=
b14850a_full -&gt; xe-pw-141824v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141824v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-141824v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1418=
24v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@core_get=
version@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@core_getversion@basic.html">FAI=
L</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_plane_multiple@tiling-x=
@pipe-a-hdmi-a-6.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_vblank@query-forked-busy@=
pipe-a-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-5/igt@xe_exec=
_basic@many-execqueues-bindexecqueue-userptr.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b12=
7e9abb14850a/shard-lnl-1/igt@xe_exec_basic@many-execqueues-bindexecqueue-us=
erptr.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-lnl-3/igt@xe_exec_basic@many-execqueues-bindexec=
queue-userptr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-6/igt@xe_pm_re=
sidency@idle-residency-on-exec.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-6/igt@xe_pm_residenc=
y@idle-residency-on-exec.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b3861=
4aa85276a78b127e9abb14850a/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip-async-flip.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3600">Intel XE#3600</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-3=
/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"=
>DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_pl=
ane_multiple@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-4=
36/igt@kms_plane_multiple@tiling-x.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_vbla=
nk@query-forked-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_vblank=
@query-forked-busy.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_exec=
_threads@threads-cm-userptr.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-6/igt@xe_exec_threads@threads-cm-userptr.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3604">Intel XE#3604</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1=
/shard-bmg-3/igt@xe_exec_threads@threads-cm-userptr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_modu=
le_load@many-reload.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
bmg-2/igt@xe_module_load@many-reload.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg=
-1/igt@xe_module_load@many-reload.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_modu=
le_load@reload-no-display.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
bmg-6/igt@xe_module_load@reload-no-display.html">PASS</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@x=
e_module_load@reload-no-display.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141824v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@core_ho=
tunplug@hotrebind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/ig=
t@core_hotunplug@hotrebind.html">PASS</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@core_hotunplug@ho=
trebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@core_se=
tmaster@master-drop-set-user.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-bmg-2/igt@core_setmaster@master-drop-set-user.html">PASS</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1=
/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@fbdev@i=
nfo.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@fbdev@info.h=
tml">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-141824v1/shard-bmg-1/igt@fbdev@info.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@fbdev@unaligned-read.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134=
">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_at=
omic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38=
614aa85276a78b127e9abb14850a/shard-adlp-6/igt@kms_atomic_transition@plane-a=
ll-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-8/igt@kms_a=
tomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Int=
el XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/ig=
t@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_big=
_fb@x-tiled-addfb.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/ig=
t@kms_big_fb@x-tiled-addfb.html">PASS</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@x-tile=
d-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-str=
ide-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf=
-tiled-ccs@pipe-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y=
f-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-3/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-4/igt@kms_c=
ursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Inte=
l XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +13 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms=
_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_flip@=
2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_fli=
p@wf_vblank-ts-check.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4=
/igt@kms_flip@wf_vblank-ts-check.html">PASS</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_flip@wf=
_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_leas=
e@possible-crtcs-filtering.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_lease@possible=
-crtcs-filtering.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb=
14850a/shard-adlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">=
PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_pm_=
rpm@legacy-planes-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg=
-6/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_=
rpm@legacy-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_pm_r=
pm@universal-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_rpm@universal=
-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-u=
pdate-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_psr@psr-sprite-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-4/igt@kms_un=
iversal_plane@cursor-fb-leak.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-=
9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-4/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b12=
7e9abb14850a/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdm=
i-a-1.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pi=
pe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-5/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9a=
bb14850a/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.ht=
ml">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141824v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-=
1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_dma_b=
uf_sync@export-dma-buf-once-read-sync.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_dma_=
buf_sync@export-dma-buf-once-read-sync.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +63 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_exec_=
balancer@many-parallel-userptr-rebind.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_exec=
_balancer@many-parallel-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_exec=
_basic@many-bindexecqueue-rebind.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a=
/shard-bmg-4/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sha=
rd-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#113=
0</a>) +124 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +26 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-2/igt@xe_exec=
_reset@virtual-close-fd-no-exec.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-8/igt@xe_exec_rese=
t@virtual-close-fd-no-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +2 other test=
s dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@xe_gt_f=
req@freq_suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-141824v1/shard-adlp-2/igt@xe_gt_freq@freq_suspend.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_oa@oa-exponents@rcs-0.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@xe_pm@s2idle-basic.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@xe_pm@=
s4-multiple-execs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-1/i=
gt@xe_pm@s4-multiple-execs.html">PASS</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-9/igt@xe_pm@s4-multipl=
e-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-1/igt@xe_pm_r=
esidency@toggle-gt-c6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-=
4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-3/igt@xe_pm_res=
idency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@core_ge=
tversion@all-cards.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/i=
gt@core_getversion@all-cards.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@c=
ore_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@core_ho=
tunplug@hotrebind-lateclose.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1=
/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> +2 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@core_h=
otunplug@hotreplug-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@=
core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@core_se=
tmaster@master-drop-set-shared-fd.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850=
a/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel=
 XE#3453</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141824v1/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@fbdev@nu=
llptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@fbdev@nullptr.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@fbdev@=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@fbdev@read.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@fbdev@u=
naligned-write.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@f=
bdev@unaligned-write.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@fbdev@una=
ligned-write.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-8/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426=
">Intel XE#1426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-141824v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_b=
ig_fb@4-tiled-addfb-size-overflow.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850=
a/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141824v1/shard-dg2-435/igt@kms_big_fb@4-tiled-addfb-size-overflow.html"=
>PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_big=
_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85=
276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bp=
p-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +20 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_big_=
fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1=
/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Int=
el XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141824v1/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rot=
ate-0-hflip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1485=
0a/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Int=
el XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141824v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS=
</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_draw=
_crc@draw-method-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_dr=
aw_crc@draw-method-mmap-wc.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_fli=
p@2x-nonexisting-fb.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/=
igt@kms_flip@2x-nonexisting-fb.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/ig=
t@kms_flip@2x-nonexisting-fb.html">PASS</a> +115 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_f=
lip@busy-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@=
kms_flip@busy-flip.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436=
/igt@kms_flip@busy-flip.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-1/igt@kms_fli=
p@flip-vs-absolute-wf_vblank.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824=
v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_fli=
p@flip-vs-absolute-wf_vblank@b-hdmi-a3.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b12=
7e9abb14850a/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_v=
blank@b-hdmi-a3.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-1/igt@kms_fl=
ip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a7=
8b127e9abb14850a/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-=
hdmi-a1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a> +4 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_f=
lip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b3861=
4aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp=
-linear-to-64bpp-linear-upscaling.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v=
1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-u=
pscaling.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard=
-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a>=
 +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-1/igt@kms_fro=
ntbuffer_tracking@fbc-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-lnl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel X=
E#2932</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_leas=
e@cursor-implicit-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_lea=
se@cursor-implicit-plane.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_mma=
p_write_crc@main@pipe-a-dp-2.html">DMESG-FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1485=
0a/shard-bmg-2/igt@kms_mmap_write_crc@main@pipe-a-dp-2.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-bmg-3/igt@kms_mmap_write_crc@main@pipe-a-dp-2.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_pla=
ne_scaling@plane-upscale-20x20-with-pixel-format.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8=
5276a78b127e9abb14850a/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-20x2=
0-with-pixel-format.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/=
igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_plan=
e_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Inte=
l XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_plane_scaling@plane-upscale=
-20x20-with-pixel-format@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_plan=
e_scaling@plane-upscale-20x20-with-pixel-format@pipe-b.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-141824v1/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pi=
xel-format@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_pm_=
rpm@basic-pci-d3-state.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg=
-6/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel X=
E#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-bmg-3/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_pm_=
rpm@cursor.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_p=
m_rpm@cursor.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_pm_rpm@cursor=
.html">PASS</a> +4 other tests pass</li>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-7/igt@kms_pm_=
rpm@cursor.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-4/igt=
@kms_pm_rpm@cursor.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-7/igt@kms_pm_rpm@=
cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_r=
pm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms=
_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_p=
m_rpm@modeset-lpsp.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435=
/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt=
@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-5/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9a=
bb14850a/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141824v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak=
@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_vbl=
ank@ts-continuation-dpms-suspend.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb=
14850a/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3426">I=
ntel XE#3426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-141824v1/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_vbl=
ank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a7=
8b127e9abb14850a/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pi=
pe-a-hdmi-a-3.html">DMESG-WARN</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/igt@kms_vblank@ts-continuati=
on-dpms-suspend@pipe-a-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-6/igt@xe_ccs@s=
uspend-resume@tile64-compressed-compfmt0-system-system.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Inte=
l XE#2932</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-141824v1/shard-lnl-6/igt@xe_ccs@suspend-resume@tile64-compressed-compf=
mt0-system-system.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_ev=
ict_ccs@evict-overcommit-parallel-instantfree-reopen.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa852=
76a78b127e9abb14850a/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-parall=
el-instantfree-reopen.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_evi=
ct_ccs@evict-overcommit-parallel-instantfree-reopen.html">PASS</a> +63 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_exe=
c_balancer@many-execqueues-virtual-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard=
-dg2-435/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html">PASS</a>=
 +43 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_exec_=
balancer@twice-parallel-userptr-invalidate.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v=
1/shard-bmg-6/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_exec=
_basic@once-bindexecqueue-userptr-invalidate-race.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userpt=
r-invalidate-race.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_exec_basi=
c@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +254 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec=
_basic@twice-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/i=
gt@xe_exec_basic@twice-basic.html">DMESG-WARN</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6=
/igt@xe_exec_basic@twice-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_=
fault_mode@many-bindexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/i=
gt@xe_exec_fault_mode@many-bindexecqueue-imm.html">PASS</a> +120 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-rebind:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec=
_threads@threads-bal-fd-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-bmg-2/igt@xe_exec_threads@threads-bal-fd-rebind.html">DMESG-WARN</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel=
 XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_exec_threads@threads-bal-fd-r=
ebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-9/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b=
38614aa85276a78b127e9abb14850a/shard-adlp-4/igt@xe_fault_injection@inject-f=
ault-probe-function-xe_guc_ads_init.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc=
_ads_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38=
614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_fault_injection@inject-faul=
t-probe-function-xe_guc_ct_init.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/=
shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_in=
it.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd=
26b38614aa85276a78b127e9abb14850a/shard-adlp-1/igt@xe_fault_injection@injec=
t-fault-probe-function-xe_tile_init_early.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shar=
d-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_ea=
rly.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-1/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85=
276a78b127e9abb14850a/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe=
-function-xe_wopcm_init.html">ABORT</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-3/igt@xe_fault_injection@=
inject-fault-probe-function-xe_wopcm_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_live=
_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9a=
bb14850a/shard-bmg-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1999">Intel XE#1999</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mo=
cs_kernel_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-3/igt@xe_modul=
e_load@many-reload.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-lnl-1/igt@xe_module_load@many-=
reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_modu=
le_load@reload.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@x=
e_module_load@reload.html">FAIL</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_module_load@reload.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_pm@s=
3-vm-bind-unbind-all.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard=
-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#17=
27</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346=
8">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-unbind-al=
l.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-9/igt@xe_pm@=
s4-basic-exec.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-2/igt@=
xe_pm@s4-basic-exec.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v=
1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_pm_r=
esidency@gt-c6-freeze@gt1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt1.html">DMESG-FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt1.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@invalid-flag:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_wait=
fence@invalid-flag.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/i=
gt@xe_waitfence@invalid-flag.html">DMESG-WARN</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3=
/igt@xe_waitfence@invalid-flag.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-1/igt@xe_wed=
ged@wedged-mode-toggle.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-adlp-6/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE=
#358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-adlp-8/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@core_=
getversion@all-cards.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-4=
34/igt@core_getversion@all-cards.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466=
/igt@core_getversion@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@core_=
hotunplug@hotrebind-lateclose.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel X=
E#1885</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclo=
se.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@core_=
hotunplug@hotreplug.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-43=
4/igt@core_hotunplug@hotreplug.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/=
igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@core_ho=
tunplug@hotunplug-rescan.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-b=
mg-1/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard=
-bmg-1/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@fbdev=
@unaligned-write.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/i=
gt@fbdev@unaligned-write.html">PASS</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@fbd=
ev@unaligned-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_3d.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_3d.html"=
>DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_a=
ddfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9ab=
b14850a/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/623">Intel XE#623</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_asy=
nc_flips@invalid-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-6/igt@kms_async_flips@invalid-async-flip.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Inte=
l XE#873</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141824v1/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ato=
mic@plane-primary-overlay-mutable-zpos.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb=
14850a/shard-bmg-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
385">Intel XE#2385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_atomic@plane-prima=
ry-overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing-internal-panels.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1=
fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_atomic_transition@p=
lane-all-modeset-transition-fencing-internal-panels.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#237=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
824v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fe=
ncing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_b=
ig_fb@4-tiled-16bpp-rotate-0.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big=
_fb@4-tiled-16bpp-rotate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_b=
ig_fb@4-tiled-32bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316=
">Intel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_big=
_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1=
/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_b=
ig_fb@linear-32bpp-rotate-180.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-180.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_big=
_fb@linear-32bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141824v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327"=
>Intel XE#2327</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_big=
_fb@linear-8bpp-rotate-180.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard=
-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_big=
_fb@linear-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b1=
27e9abb14850a/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
0.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_big_fb@linear-max-=
hw-stride-32bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_=
fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_=
big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_b=
ig_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-141824v1/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
16">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_b=
ig_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b3861=
4aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v=
1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-as=
ync-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8=
5276a78b127e9abb14850a/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64=
bpp-rotate-180-async-flip.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sh=
ard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_big=
_fb@y-tiled-16bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-4/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-0.html">INCOMPLETE</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850=
a/shard-adlp-9/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#18=
74</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
1824v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel X=
E#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_b=
ig_fb@y-tiled-64bpp-rotate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp=
-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_big=
_fb@y-tiled-addfb.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/ig=
t@kms_big_fb@y-tiled-addfb.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms=
_big_fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_b=
ig_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9a=
bb14850a/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_=
big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big=
_fb@y-tiled-addfb-size-overflow.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/=
shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
10">Intel XE#610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e=
9abb14850a/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-18=
0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_big_fb@y-t=
iled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +15 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
824v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_b=
ig_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bp=
p-rotate-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434=
/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_b=
ig_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bp=
p-rotate-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1=
/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_b=
ig_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b3=
8614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41824v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180=
-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_big=
_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_big=
_fb@yf-tiled-addfb.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/i=
gt@kms_big_fb@yf-tiled-addfb.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sha=
rd-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_big=
_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9ab=
b14850a/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/607">Intel XE#607</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offse=
t-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_bw@=
connected-linear-tiling-2-displays-1920x1080p.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b1=
27e9abb14850a/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-192=
0x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_bw@connected-linea=
r-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_b=
w@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78=
b127e9abb14850a/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays=
-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg=
2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@=
connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b1=
27e9abb14850a/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-192=
0x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-=
4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel =
XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2894">Intel XE#2894</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_b=
w@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78=
b127e9abb14850a/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays=
-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2191">Intel XE#2191</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-=
dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_bw@=
connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b1=
27e9abb14850a/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-384=
0x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-=
1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-141824v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sh=
ard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@=
linear-tiling-1-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-display=
s-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@=
linear-tiling-2-displays-1920x1080p.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_bw@l=
inear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/=
igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_b=
w@linear-tiling-3-displays-3840x2160p.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1=
4850a/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_bw@lin=
ear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_bw@=
linear-tiling-4-displays-3840x2160p.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">In=
tel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141824v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@=
bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6=
/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_ccs@=
bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1=
/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_cc=
s@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/=
igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_ccs=
@crc-primary-rotation-180-4-tiled-bmg-ccs.html">INCOMPLETE</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78=
b127e9abb14850a/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bm=
g-ccs.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_=
ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_c=
cs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9ab=
b14850a/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-43=
4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_c=
cs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a7=
8b127e9abb14850a/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled=
-gen12-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg=
2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">In=
tel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tile=
d-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/ig=
t@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) +13 other tests skip</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_c=
cs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-141824v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen1=
2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bm=
g-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard=
-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7=
/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Int=
el XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_ccs=
@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9ab=
b14850a/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_ccs@crc-primary-=
suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_ccs=
@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850=
a/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9a=
bb14850a/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.ht=
ml">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b=
127e9abb14850a/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-=
rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ccs@crc-sprite-p=
lanes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9a=
bb14850a/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127=
e9abb14850a/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-=
ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_ccs@crc-=
sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +22 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_c=
cs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9ab=
b14850a/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_ccs@=
crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_ccs=
@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a=
/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel X=
E#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@k=
ms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_cdc=
lk@plane-scaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt=
@kms_cdclk@plane-scaling.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_c=
dclk@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_ch=
amelium_audio@dp-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard=
-dg2-436/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_cha=
melium_color@ctm-0-50.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-=
4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1=
/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_c=
hamelium_color@ctm-0-50.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg=
2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cha=
melium_color@ctm-blue-to-red.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cha=
melium_color@ctm-limited-range.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-bmg-6/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#23=
25</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_chamelium_color@ctm-limited-range.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_ch=
amelium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-4=
35/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_chameli=
um_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_cha=
melium_edid@dp-edid-read.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-b=
mg-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_c=
hamelium_frames@hdmi-cmp-planes-random.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb=
14850a/shard-dg2-434/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_cham=
elium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_c=
hamelium_frames@vga-frame-dump.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_chamelium_frames@vga=
-frame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cham=
elium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/=
igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)=
 +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_cham=
elium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/ig=
t@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_cha=
melium_hpd@hdmi-hpd-after-suspend.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850=
a/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel=
 XE#2252</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-after=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_cha=
melium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9ab=
b14850a/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_col=
or@deep-color.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@km=
s_color@deep-color.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_color@d=
eep-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2423">Intel XE#2423</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_con=
tent_protection@atomic-dpms.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141824v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"=
>Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_con=
tent_protection@content-type-change.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-bmg-6/igt@kms_content_protection@content-type-change.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">I=
ntel XE#2341</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_content_protection@conte=
nt-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_c=
ontent_protection@dp-mst-lic-type-0.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/307">Intel XE#307</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_content_pr=
otection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/ig=
t@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_con=
tent_protection@dp-mst-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_c=
ontent_protection@lic-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-dg2-436/igt@kms_content_protection@lic-type-1.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_content_protection@lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_con=
tent_protection@srm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/=
igt@kms_content_protection@srm.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-bmg-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_con=
tent_protection@type1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-=
4/igt@kms_content_protection@type1.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1=
/igt@kms_content_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_c=
ontent_protection@uevent.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-d=
g2-434/igt@kms_content_protection@uevent.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_content_protection@uevent.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_c=
ursor_crc@cursor-offscreen-512x170.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1485=
0a/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/308">Intel XE#308</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_cursor_crc@c=
ursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cur=
sor_crc@cursor-onscreen-256x256.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/=
shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html">DMESG-FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen=
-256x256.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cur=
sor_crc@cursor-onscreen-32x10.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_cur=
sor_crc@cursor-onscreen-512x512.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/=
shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#=
2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x5=
12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_curs=
or_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@km=
s_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_cur=
sor_crc@cursor-onscreen-max-size.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a=
/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel X=
E#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cur=
sor_crc@cursor-random-32x32.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141824v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320"=
>Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_c=
ursor_crc@cursor-random-512x512.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/=
shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
08">Intel XE#308</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_cursor_crc@cursor-=
random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_cur=
sor_crc@cursor-rapid-movement-512x512.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1=
4850a/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
1">Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_curs=
or_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@k=
ms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cur=
sor_crc@cursor-sliding-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#23=
21</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_c=
ursor_crc@cursor-sliding-64x64.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575">i915#2575</a>) +66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_cur=
sor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78=
b127e9abb14850a/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cu=
rsor-legacy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2286">Intel XE#2286</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_=
cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
824v1/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varyi=
ng-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cur=
sor_legacy@cursora-vs-flipb-atomic.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1485=
0a/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141824v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_cur=
sor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b386=
14aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-atomic-transitions-varying-size.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-=
varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1485=
0a/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WA=
RN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-=
vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sha=
rd-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_c=
ursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b3=
8614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#32=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-bef=
ore-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_cur=
sor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b386=
14aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_cursor_legacy@short-busy-fl=
ip-before-cursor-atomic-transitions.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic=
-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_dir=
tyfb@fbc-dirtyfb-ioctl.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg=
-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg=
-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_dis=
play_modes@mst-extended-mode-negative.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1=
4850a/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
3">Intel XE#2323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_display_modes@mst-ex=
tended-mode-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_dit=
her@fb-8bpc-vs-panel-6bpc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel X=
E#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel=
 XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_d=
sc@dsc-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@k=
ms_dsc@dsc-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt=
@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_dsc=
@dsc-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_d=
sc@dsc-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_dsc@dsc-basic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_dsc=
@dsc-fractional-bpp.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/=
igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_dsc=
@dsc-with-bpc-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-=
1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_ds=
c@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/=
igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_d=
sc@dsc-with-output-formats-with-bpc.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">I=
ntel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_dsc@dsc-with-output-form=
ats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_f=
bcon_fbt@fbc-suspend.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard=
-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346=
8">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_f=
bcon_fbt@psr-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-4=
36/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-b=
mg-7/igt@kms_feature_discovery@chamelium.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE=
#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_fea=
ture_discovery@display-2x.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
bmg-1/igt@kms_feature_discovery@display-2x.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel X=
E#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel=
 XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_fea=
ture_discovery@display-3x.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
bmg-6/igt@kms_feature_discovery@display-3x.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sha=
rd-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fea=
ture_discovery@psr1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/=
igt@kms_feature_discovery@psr1.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-bmg-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_f=
eature_discovery@psr1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-=
435/igt@kms_feature_discovery@psr1.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_fli=
p@2x-absolute-wf_vblank-interruptible.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1=
4850a/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_fli=
p@2x-flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-=
interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@km=
s_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE=
#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_fli=
p@2x-flip-vs-expired-vblank.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1=
/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/i=
gt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-wf_vblank.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg=
-1/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fli=
p@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9=
abb14850a/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.=
html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_flip@2=
x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_fli=
p@2x-wf_vblank-ts-check.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bm=
g-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-b=
mg-1/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_f=
lip@absolute-wf_vblank.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2=
-436/igt@kms_flip@absolute-wf_vblank.html">DMESG-WARN</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel X=
E#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_fli=
p_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b386=
14aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-=
yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380"=
>Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs=
-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_f=
lip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b3=
8614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32=
bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-=
to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_f=
lip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614a=
a85276a78b127e9abb14850a/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-141824v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-y=
tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_f=
lip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b3=
8614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32=
bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
824v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">I=
ntel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-141824v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614a=
a85276a78b127e9abb14850a/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-16bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel =
XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-141824v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8=
5276a78b127e9abb14850a/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile=
-to-16bpp-ytile-upscaling.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-=
bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#22=
93</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/238=
0">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-t=
o-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_f=
orce_connector_basic@prune-stale-modes.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb=
14850a/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_fo=
rce_connector_basic@prune-stale-modes.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primsc=
rn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85=
276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scnd=
scrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bm=
g-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
11">Intel XE#2311</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_f=
rontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614=
aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-141824v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr=
-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Inte=
l XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-141824v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-rgb101010-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard=
-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_fro=
ntbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9=
abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-=
rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_f=
rontbuffer_tracking@drrs-suspend.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a=
/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_frontbuffer_trac=
king@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa=
85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-off=
scren-pri-shrfb-draw-render.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@km=
s_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscr=
n-shrfb-pgflip-blt.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/i=
gt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa852=
76a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-=
2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"=
>Intel XE#2333</a>) +14 other tests fail</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_f=
rontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8=
5276a78b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-pr=
imscrn-spr-indfb-draw-blt.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Inte=
l XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-141824v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-sp=
r-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa=
85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-spr-indfb-draw-render.html">DMESG-FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v=
1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa=
85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-cur-indfb-draw-render.html">DMESG-FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v=
1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-r=
ender.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614a=
a85276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sh=
ard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-=
wc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2=
333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41824v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614a=
a85276a78b127e9abb14850a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-=
wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2333">Intel XE#2333</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a7=
8b127e9abb14850a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-s=
pr-indfb-move.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscr=
n-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/=
igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbc-tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#23=
52</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
1824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_f=
rontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b3=
8614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
824v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8=
5276a78b127e9abb14850a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-=
primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-=
bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435=
/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614a=
a85276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85=
276a78b127e9abb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-p=
rimscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bm=
g-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-141824v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pr=
i-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_f=
rontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78=
b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-sc=
aledprimary.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_=
frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)=
 +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1485=
0a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2352">Intel XE#2352</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdr=
rs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41824v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8=
5276a78b127e9abb14850a/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg=
2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
824v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_f=
rontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b=
127e9abb14850a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scal=
edprimary.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-=
436/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9a=
bb14850a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +20 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127=
e9abb14850a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-ren=
der.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@f=
bcpsr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_f=
rontbuffer_tracking@plane-fbc-rte.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850=
a/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel=
 XE#1158</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@plane-fbc-rte.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/=
shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
350">Intel XE#2350</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-r=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_f=
rontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8=
5276a78b127e9abb14850a/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-pr=
imscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg=
2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
53">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sha=
rd-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">=
Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscr=
n-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/i=
gt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Inte=
l XE#2313</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_f=
rontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa852=
76a78b127e9abb14850a/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-prim=
scrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824=
v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8=
5276a78b127e9abb14850a/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-prim=
scrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-=
bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_fro=
ntbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa=
85276a78b127e9abb14850a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shar=
d-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_get=
fb@getfb-reject-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/=
igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_get=
fb@getfb2-accept-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5=
/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/i=
gt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_joi=
ner@basic-big-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7=
/igt@kms_joiner@basic-big-joiner.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_joi=
ner@basic-force-big-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard=
-bmg-2/igt@kms_joiner@basic-force-big-joiner.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
12">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_joi=
ner@basic-force-ultra-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934"=
>Intel XE#2934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_j=
oiner@invalid-modeset-big-joiner.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a=
/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/346">Intel XE#346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_joi=
ner@invalid-modeset-force-ultra-joiner.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb=
14850a/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2934">Intel XE#2934</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_joiner@invalid-mod=
eset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-d=
g2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE=
#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_j=
oiner@invalid-modeset-ultra-joiner.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1485=
0a/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_joi=
ner@invalid-modeset-ultra-joiner.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a=
/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2927">Intel XE#2927</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pan=
el_fitting@atomic-fastset.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
bmg-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel X=
E#2486</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel=
 XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_p=
lane@plane-panning-bottom-right-suspend.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9ab=
b14850a/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend.html=
">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1035">Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sh=
ard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_p=
lane_cursor@overlay.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-43=
4/igt@kms_plane_cursor@overlay.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i91=
5#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-dg2-434/igt@kms_plane_cursor@overlay.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_plane_low=
res@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pla=
ne_lowres@tiling-yf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/=
igt@kms_plane_lowres@tiling-yf.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-bmg-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pla=
ne_multiple@tiling-yf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-=
4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_plan=
e_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with=
-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_p=
lane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8=
5276a78b127e9abb14850a/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-=
factor-0-25-with-rotation.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-fac=
tor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other =
test skip</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa852=
76a78b127e9abb14850a/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-fact=
or-0-25-with-rotation.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_plan=
e_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pla=
ne_scaling@planes-downscale-factor-0-5.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb=
14850a/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_plane_scaling@plan=
es-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_pla=
ne_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b386=
14aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_plane_scaling@planes-upscal=
e-factor-0-25-downscale-factor-0-25.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale=
-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_pm_=
backlight@bad-brightness.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-b=
mg-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
1824v1/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#87=
0</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_b=
acklight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_p=
m_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_=
backlight@fade.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@k=
ms_pm_backlight@fade.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/i=
gt@kms_pm_backlight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_pm_=
backlight@fade-with-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-b=
mg-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-b=
mg-1/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_p=
m_dc@dc3co-vpb-simulation.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_p=
m_dc@dc5-psr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@k=
ms_pm_dc@dc5-psr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/=
igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_pm_=
dc@dc5-psr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_p=
m_dc@dc5-psr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_p=
m_dc@dc5-retention-flops.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-d=
g2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#=
3309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_pm_=
dc@dc5-retention-flops.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg=
-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_p=
m_dc@dc6-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@=
kms_pm_dc@dc6-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_=
dc@dc6-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_=
pm_dc@dc6-dpms.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1430">Intel XE#1430</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@k=
ms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-6/igt@kms_pm=
_dc@dc9-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-8/igt@km=
s_pm_dc@dc9-dpms.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3325">Intel XE#3325</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp-8/igt@=
kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_pm_=
rpm@modeset-lpsp.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt=
@kms_pm_rpm@modeset-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#31=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
1824v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/ig=
t@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3=
141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_pm=
_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_pm_=
rpm@modeset-non-lpsp.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_pm_=
rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">I=
ntel XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_pm_=
rpm@modeset-stress-extra-wait.html">INCOMPLETE</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2864">Intel XE#2864</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_pm_rpm@modeset-s=
tress-extra-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_p=
m_rpm@universal-planes-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-dg2-436/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1=
/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_psr=
2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614a=
a85276a78b127e9abb14850a/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/ig=
t@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_psr=
2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b=
127e9abb14850a/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf=
-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_ps=
r2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_p=
sr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a7=
8b127e9abb14850a/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-plane-updat=
e-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@=
kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#14=
89</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_p=
sr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8=
5276a78b127e9abb14850a/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-c=
ontinuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-=
dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr2=
_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-b=
mg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE=
#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_psr=
2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa=
85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move=
-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shar=
d-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_psr2=
_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/ig=
t@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_psr=
2_su@frontbuffer-xrgb8888.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel X=
E#2387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel=
 XE#2387</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@km=
s_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr=
2_su@page_flip-nv12.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/=
igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr@=
fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_psr@fbc-p=
r-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@kms_p=
sr@fbc-pr-cursor-plane-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_p=
sr@fbc-pr-no-drrs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/=
igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#=
2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
29">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_psr@=
fbc-psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_=
psr@fbc-psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_p=
sr@fbc-psr-no-drrs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436=
/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel X=
E#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr=
@fbc-psr2-cursor-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bm=
g-2/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#22=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/223=
4">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a>) +21 other tests skip</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_p=
sr@fbc-psr2-cursor-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
dg2-466/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel X=
E#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_ps=
r@fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_psr=
@pr-cursor-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/ig=
t@kms_psr@pr-cursor-render.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#=
2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-bmg-1/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_psr=
@psr-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_p=
sr@psr-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms=
_psr@psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_p=
sr@psr-cursor-plane-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-d=
g2-434/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#=
2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
29">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_psr=
_stress_test@invalidate-primary-flip-overlay.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b12=
7e9abb14850a/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-ov=
erlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_psr_st=
ress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_r=
otation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg=
-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_r=
otation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e=
9abb14850a/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-18=
0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/=
igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127=
</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_rot=
ation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9a=
bb14850a/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_rotation_crc@p=
rimary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sh=
ard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_rot=
ation_crc@sprite-rotation-270.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-bmg-1/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"=
>Intel XE#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-270.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_rot=
ation_crc@sprite-rotation-90.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_r=
otation_crc@sprite-rotation-90.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/341=
4">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@kms_rotation_crc@sprit=
e-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_rot=
ation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb=
14850a/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_rotation_crc@sprit=
e-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_sca=
ling_modes@scaling-mode-full.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@kms_s=
caling_modes@scaling-mode-full-aspect.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1=
4850a/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@kms_scalin=
g_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests =
skip</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@kms_sca=
ling_modes@scaling-mode-full-aspect.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">I=
ntel XE#2413</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mo=
de-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_sca=
ling_modes@scaling-mode-none.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_set=
mode@basic-clone-single-crtc.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sha=
rd-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@kms_til=
ed_display@basic-test-pattern.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426"=
>Intel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2426">Intel XE#2426</a>) +1 other test skip</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_t=
iled_display@basic-test-pattern.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/=
shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#=
1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@kms_tiled_display@ba=
sic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@kms_t=
iled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b=
127e9abb14850a/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-=
chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg=
2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-lnl-5/igt@kms_uni=
versal_plane@cursor-fb-leak.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@kms_vbla=
nk@query-idle.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@kms_vblank@=
query-idle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_vrr=
@flip-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_=
vrr@flip-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_vrr@flip-ba=
sic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-5/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_vrr=
@flipline.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@kms_vr=
r@flipline.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1499">Intel XE#1499</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@kms_v=
rr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1499">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@kms_vrr@=
max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_vrr@max-min.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_wri=
teback@writeback-check-output-xrgb2101010.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9=
abb14850a/shard-bmg-4/igt@kms_writeback@writeback-check-output-xrgb2101010.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@kms_writeback@writ=
eback-check-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2=
-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@kms_wri=
teback@writeback-invalid-parameters.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb148=
50a/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@kms_writeback@writeback-invali=
d-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@kms_wri=
teback@writeback-pixel-formats.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-bmg-2/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@sriov_b=
asic@enable-vfs-autoprobe-off.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2849">Intel XE#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@sriov_basic@enable-vfs-aut=
oprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@sriov_b=
asic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127=
e9abb14850a/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-=
all.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/ig=
t@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_ccs@s=
uspend-resume.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_ccs@suspend-resume.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_co=
mpute_preempt@compute-preempt-many.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1485=
0a/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Int=
el XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_compute_preem=
pt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_co=
py_basic@mem-copy-linear-0x369.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#11=
23</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
0">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_copy=
_basic@mem-set-linear-0x369.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-1/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1=
/shard-bmg-1/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) +139 other tests skip</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_co=
py_basic@mem-set-linear-0x369.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"=
>Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_co=
py_basic@mem-set-linear-0x3fff.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#11=
26</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
0">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_cop=
y_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@x=
e_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_crea=
te@multigpu-create-massive-size.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/=
shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#=
1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
504">Intel XE#2504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/shard-bmg-7/igt@xe_create@multigpu-create-massive-si=
ze.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_drm_f=
dinfo@utilization-single-idle.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6=
/igt@xe_drm_fdinfo@utilization-single-idle.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_eu=
debug@basic-vm-access.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-=
435/igt@xe_eudebug@basic-vm-access.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-dg2-436/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_eude=
bug@basic-vm-access-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Int=
el XE#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141824v1/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"=
>Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_eude=
bug@vm-bind-clear.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/ig=
t@xe_eudebug@vm-bind-clear.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_=
eudebug@vm-bind-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_eude=
bug_online@breakpoint-many-sessions-single-tile.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78=
b127e9abb14850a/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-=
single-tile.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_e=
udebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905=
</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_eud=
ebug_online@pagefault-read.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe=
_eudebug_online@pagefault-read.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_eudeb=
ug_online@pagefault-write.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_eu=
debug_online@pagefault-write.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_eudeb=
ug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_eu=
debug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_ev=
ict@evict-beng-large-multi-vm-cm.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a=
/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel X=
E#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1600">Intel XE#1600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-=
vm-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_evic=
t@evict-beng-large-multi-vm-cm.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-bmg-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#23=
64</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
1824v1/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_evic=
t@evict-beng-mixed-many-threads-large.html">TIMEOUT</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9a=
bb14850a/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_evict@evict-beng-m=
ixed-many-threads-large.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_evi=
ct@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg=
2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel X=
E#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_evic=
t@evict-large-multi-vm-cm.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel X=
E#2364</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-bmg-4/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel=
 XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_ev=
ict@evict-mixed-many-threads-small.html">INCOMPLETE</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9a=
bb14850a/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/113=
0">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_evict@evict-mixed-m=
any-threads-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa=
85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execque=
ues-many-vm-null-defer-mmap.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shar=
d-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2322">Intel XE#2322</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b3861=
4aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v=
1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-in=
validate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-141824v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-=
userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_=
basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-=
5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_exec=
_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85=
276a78b127e9abb14850a/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecq=
ueue-userptr-invalidate.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_exec=
_basic@once-bindexecqueue.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
bmg-6/igt@xe_exec_basic@once-bindexecqueue.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#11=
30</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidat=
e:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_exec=
_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f=
1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_compute_mode@m=
any-execqueues-bindexecqueue-userptr-invalidate.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">In=
tel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-141824v1/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-bindex=
ecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_exec_=
fault_mode@many-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#113=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141=
824v1/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalid=
ate-imm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_ex=
ec_fault_mode@once-bindexecqueue-imm.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14=
850a/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"=
>Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bi=
ndexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_ex=
ec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b12=
7e9abb14850a/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebin=
d-imm.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_exec_fa=
ult_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shar=
d-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_ex=
ec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78=
b127e9abb14850a/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupte=
d-dma-fence.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe=
_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_ex=
ec_sip_eudebug@breakpoint-writesip.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1485=
0a/shard-dg2-436/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Int=
el XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoi=
nt-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_ex=
ec_threads@threads-shared-vm-userptr-rebind.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127=
e9abb14850a/shard-dg2-436/igt@xe_exec_threads@threads-shared-vm-userptr-reb=
ind.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_e=
xec_threads@threads-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_fa=
ult_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b=
38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_fault_injection@inject-=
fault-probe-function-xe_guc_ct_init.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_gu=
c_ct_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd2=
6b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_fault_injection@inject-=
fault-probe-function-xe_tile_init_early.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3=
467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41824v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_t=
ile_init_early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_fa=
ult_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b3=
8614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_fault_injection@inject-f=
ault-probe-function-xe_uc_fw_init.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v=
1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw=
_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
41824v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe=
_wopcm_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_faul=
t_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa=
85276a78b127e9abb14850a/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_=
bind_ioctl_ops_create.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-=
1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">In=
tel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_faul=
t_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa8527=
6a78b127e9abb14850a/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind=
_ioctl_ops_execute.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_fault_in=
jection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v=
1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_run.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/sh=
ard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-2/igt@xe_faul=
t_injection@vm-bind-fail-xe_vma_ops_alloc.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9=
abb14850a/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.=
html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-3/=
igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#349=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_fa=
ult_injection@vm-create-fail-xe_pt_create.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9=
abb14850a/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_pt_create.=
html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_fault=
_injection@vm-create-fail-xe_pt_create.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_fault=
_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#346=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468=
">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm=
_create_scratch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_gt=
_freq@freq_suspend.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-d=
g2-434/igt@xe_gt_freq@freq_suspend.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_gt_freq@freq_suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_live=
_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9ab=
b14850a/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2229">Intel XE#2229</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_valida=
te_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_medi=
a_fill@media-fill.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/ig=
t@xe_media_fill@media-fill.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#=
2596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-bmg-4/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596"=
>Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_mmap=
@small-bar.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_mm=
ap@small-bar.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/586">Intel XE#586</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_mmap@small-bar.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_mo=
dule_load@reload.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2=
-466/igt@xe_module_load@reload.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-dg2-435/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_oa=
@map-oa-buffer.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt=
@xe_oa@map-oa-buffer.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-4=
35/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_oa=
@oa-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe=
_oa@oa-formats.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt=
@xe_oa@oa-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_oa@o=
a-tlb-invalidate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt=
@xe_oa@oa-tlb-invalidate.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-b=
mg-7/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_oa@=
syncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-436/igt@xe_oa@s=
yncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_oa@un=
privileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/ig=
t@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@xe_pat@pat-index=
-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_pe=
er2peer@read.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@x=
e_peer2peer@read.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/=
igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_pm@d=
3cold-basic-exec.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt=
@xe_pm@d3cold-basic-exec.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_pm=
@d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pm@d=
3cold-mocs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_pm=
@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-2/igt@xe_=
pm@d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/igt@xe_pm@d3col=
d-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-4/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-1/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_pm=
@s2idle-d3cold-basic-exec.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel X=
E#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/366">Intel XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-141824v1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-436/igt@xe_pm=
@s3-d3hot-basic-exec.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard=
-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#34=
68</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569=
">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">In=
tel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_pm=
@s3-vm-bind-unbind-all.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2=
-435/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-unb=
ind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-5/igt@xe_pm@s4=
-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-6/ig=
t@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_pm@=
s4-d3hot-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-435/igt@xe_pm@s4-=
d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_pm@s=
4-multiple-execs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt=
@xe_pm@s4-multiple-execs.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel=
 XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141824v1/shard-bmg-4/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp-4/igt@xe_pm@=
s4-vm-bind-unbind-all.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-adlp=
-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-adlp=
-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_pm=
@vram-d3cold-threshold.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2=
-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824=
v1/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)=
</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_pm@v=
ram-d3cold-threshold.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1=
/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/s=
hard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_pm=
_residency@cpg-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-4=
36/igt@xe_pm_residency@cpg-basic.html">DMESG-WARN</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#17=
27</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346=
8">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_pm_residency@cpg-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">=
Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_pm_r=
esidency@toggle-gt-c6.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-1/igt@xe_pm_residency@toggle-gt-c6.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-bmg-1/igt@xe_pm_residency@toggle-gt-c6.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#11=
30</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-435/igt@xe_qu=
ery@multigpu-query-config.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-=
dg2-466/igt@xe_query@multigpu-query-config.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE=
#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
141824v1/shard-dg2-435/igt@xe_query@multigpu-query-config.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE=
#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_query=
@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-bmg-7/igt@xe_qu=
ery@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_qu=
ery@multigpu-query-engines.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard=
-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel =
XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-141824v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-1/igt@xe_quer=
y@multigpu-query-invalid-extension.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb1485=
0a/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Int=
el XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-141824v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-466/igt@xe_que=
ry@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-4=
35/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_quer=
y@multigpu-query-invalid-query.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/s=
hard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1418=
24v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-3/igt@xe_quer=
y@multigpu-query-invalid-size.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-bmg-1/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">=
Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-141824v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-size.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-conflict:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-7/igt@xe_vm@b=
ind-execqueues-conflict.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/sh=
ard-bmg-1/igt@xe_vm@bind-execqueues-conflict.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel=
 XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-141824v1/shard-bmg-4/igt@xe_vm@bind-execqueues-conflict.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"=
>Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-dg2-434/igt@xe_vm=
@munmap-style-unbind-many-either-side-partial.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b1=
27e9abb14850a/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-=
partial.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-141824v1/shard-dg2-434/igt@xe_vm@munmap-style-u=
nbind-many-either-side-partial.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +112 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shard-bmg-6/igt@xe_wedg=
ed@wedged-mode-toggle.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a/shar=
d-bmg-2/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Int=
el XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-141824v1/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel=
 XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a -&gt; xe-pw-141=
824v1</li>
</ul>
<p>IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2282-241f1fd26b38614aa85276a78b127e9abb14850a: 241f1fd26b38614aa85276a=
78b127e9abb14850a<br />
  xe-pw-141824v1: 141824v1</p>

</body>
</html>

--===============8312941046852757141==--
