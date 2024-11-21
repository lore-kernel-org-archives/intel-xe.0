Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED47D75BBB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 05:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B921D10E068;
	Thu, 21 Nov 2024 05:27:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A8F10E068;
 Thu, 21 Nov 2024 05:27:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Sort_again_the_i?=
 =?utf-8?q?nfo_flags_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Nov 2024 05:27:28 -0000
Message-ID: <173216684850.983406.6761874766377582245@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120195710.3447100-1-lucas.demarchi@intel.com>
In-Reply-To: <20241120195710.3447100-1-lucas.demarchi@intel.com>
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

== Series Details ==

Series: drm/xe: Sort again the info flags (rev2)
URL   : https://patchwork.freedesktop.org/series/141521/
State : failure

== Summary ==

CI Bug Log - changes from xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99_full -> xe-pw-141521v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141521v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141521v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141521v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_invalid_mode@zero-hdisplay@pipe-a-edp-1:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-2/igt@kms_invalid_mode@zero-hdisplay@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_invalid_mode@zero-hdisplay@pipe-a-edp-1.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_sequence@queue-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@kms_sequence@queue-idle.html

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_live_ktest@xe_bo.html

  * igt@xe_vm@mmap-style-bind-userptr-all:
    - shard-bmg:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_vm@mmap-style-bind-userptr-all.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@xe_vm@mmap-style-bind-userptr-all.html

  
#### Warnings ####

  * igt@core_auth@many-magics:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@core_auth@many-magics.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@core_auth@many-magics.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][13] ([Intel XE#1033]) -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][15] ([Intel XE#877]) -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     [SKIP][17] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_draw_crc@fill-fb.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@kms_draw_crc@fill-fb.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][19] ([Intel XE#3374]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [DMESG-WARN][21] ([Intel XE#3467]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_module_load@reload-no-display.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_module_load@reload-no-display.html

  
Known issues
------------

  Here are the changes found in xe-pw-141521v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     NOTRUN -> [FAIL][23] ([Intel XE#3440])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][24] ([Intel XE#3468])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#3453])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][27] -> [FAIL][28] ([Intel XE#3339])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2134])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-466/igt@fbdev@info.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#2134])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@fbdev@unaligned-write.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@fbdev@unaligned-write.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#2423] / [i915#2575]) +62 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_atomic@plane-invalid-params-fence.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         NOTRUN -> [FAIL][34] ([Intel XE#1426]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1407])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][36] ([Intel XE#1874])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1124]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1124]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#610])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#610])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1124]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1124]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#2191]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2191])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2314] / [Intel XE#2894])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1512])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#367])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#367])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#367])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2887]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#787]) +26 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#3442])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2887]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#787]) +76 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2325])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_chamelium_color@degamma.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#306])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#373]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#373]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2252]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#373]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#3278])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][66] ([Intel XE#1178])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#307])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#307])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2320])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#308]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#2321]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#308])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1424]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2321]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][75] ([Intel XE#3468]) +3 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#2291])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#309]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#309])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2291])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#2423])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_dp_aux_dev.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#3070])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#3070])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#2244])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#776])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-1x:
    - shard-adlp:         [PASS][87] -> [DMESG-WARN][88] ([Intel XE#3086]) +2 other tests dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@kms_feature_discovery@display-1x.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2423] / [i915#2575]) +27 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][90] -> [FAIL][91] ([Intel XE#2882]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][92] -> [FAIL][93] ([Intel XE#3486])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][94] -> [FAIL][95] ([Intel XE#3486])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][96] -> [FAIL][97] ([Intel XE#3321] / [Intel XE#3486])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][98] -> [FAIL][99] ([Intel XE#3321] / [Intel XE#3486])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][100] -> [FAIL][101] ([Intel XE#301]) +4 other tests fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][102] ([Intel XE#301]) +4 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][103] -> [FAIL][104] ([Intel XE#3321] / [Intel XE#3487])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#310]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2316]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1421]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][108] -> [SKIP][109] ([Intel XE#2316]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [FAIL][110] ([Intel XE#886]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][111] ([Intel XE#2049] / [Intel XE#2597])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][112] ([Intel XE#2049])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][113] -> [FAIL][114] ([Intel XE#886]) +1 other test fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][115] -> [FAIL][116] ([Intel XE#3149] / [Intel XE#886]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [PASS][117] -> [INCOMPLETE][118] ([Intel XE#2049]) +1 other test incomplete
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2293] / [Intel XE#2380])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1401]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2293])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#455]) +14 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#651]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2311]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [FAIL][126] ([Intel XE#2333]) +2 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][127] -> [SKIP][128] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#656]) +22 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#2136]) +10 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#651]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#656]) +18 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#651]) +7 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1151])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2313]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#653]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#653]) +7 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#658])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2136]) +26 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2312]) +8 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1503])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#455]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_plane_lowres@tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#599])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2393])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2763]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2763]) +8 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#2763]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2499])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#2446])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#836])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][154] -> [SKIP][155] ([Intel XE#2446]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][156] -> [DMESG-WARN][157] ([Intel XE#3468]) +5 other tests dmesg-warn
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_properties@connector-properties-legacy.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-2/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1489]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#2893]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#1489]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#1489]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#1122])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#1406]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#2351])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_psr@psr2-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#2939])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#3414]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#3414])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2426])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#1500])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][173] -> [FAIL][174] ([Intel XE#771] / [Intel XE#899])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][175] -> [FAIL][176] ([Intel XE#899])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][177] -> [FAIL][178] ([Intel XE#899])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#1499])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#756]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#756]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#2423]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-466/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#1280] / [Intel XE#455])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#1123])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#1123])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#1126])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#2905]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#2905]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#2905]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#2905]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][191] -> [TIMEOUT][192] ([Intel XE#1473])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][193] ([Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#688]) +5 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#688]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#2322]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#1392]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#1392]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#288]) +13 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#288]) +6 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-close-fd:
    - shard-adlp:         [PASS][201] -> [DMESG-WARN][202] ([Intel XE#3086] / [Intel XE#358])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@xe_exec_reset@parallel-close-fd.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@xe_exec_reset@parallel-close-fd.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][203] -> [DMESG-WARN][204] ([Intel XE#3371])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][205] ([Intel XE#3467])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
    - shard-bmg:          NOTRUN -> [FAIL][206] ([Intel XE#3499] / [Intel XE#3539])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#2229]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][208] ([Intel XE#2541]) +4 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#2248])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#2236])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#979])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#979])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][213] ([Intel XE#2284] / [Intel XE#366])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@xe_pm@d3cold-mmap-system.html
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2284])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#1130]) +54 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
    - shard-adlp:         [PASS][217] -> [DMESG-WARN][218] ([Intel XE#3086] / [Intel XE#569])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@xe_pm@s3-basic-exec.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][219] -> [ABORT][220] ([Intel XE#1358] / [Intel XE#1607])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-8/igt@xe_pm@s4-basic.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][221] ([Intel XE#1727] / [Intel XE#3468])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-adlp:         [PASS][222] -> [ABORT][223] ([Intel XE#1358] / [Intel XE#1607])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][224] -> [ABORT][225] ([Intel XE#1794])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-6/igt@xe_pm@s4-mocs.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][226] ([Intel XE#3088] / [Intel XE#3468])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][227] ([Intel XE#944])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@xe_query@multigpu-query-invalid-query.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#944])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_query@multigpu-query-invalid-query.html
    - shard-lnl:          NOTRUN -> [SKIP][229] ([Intel XE#944])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][230] ([Intel XE#3342])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
    - shard-dg2-set2:     [PASS][231] -> [SKIP][232] ([Intel XE#1130]) +102 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][233] ([Intel XE#2919])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     NOTRUN -> [ABORT][234] ([Intel XE#3421])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [ABORT][235] -> [PASS][236] +2 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-2/igt@core_hotunplug@hotreplug.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-4/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-lnl:          [ABORT][237] -> [PASS][238] +2 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-6/igt@core_hotunplug@hotunplug-rescan.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][239] ([Intel XE#3130] / [Intel XE#3249]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster_vs_auth:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2423]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@core_setmaster_vs_auth.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@core_setmaster_vs_auth.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2134]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@fbdev@write.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@fbdev@write.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-lnl:          [INCOMPLETE][245] ([Intel XE#3466]) -> [PASS][246] +1 other test pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][247] ([Intel XE#1033]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2423] / [i915#2575]) -> [PASS][250] +46 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][251] ([Intel XE#2291]) -> [PASS][252] +3 other tests pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-lnl:          [FAIL][253] ([Intel XE#1475]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][255] ([Intel XE#2316]) -> [PASS][256] +3 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][257] ([Intel XE#3321] / [Intel XE#3487]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][259] ([Intel XE#886]) -> [PASS][260] +1 other test pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][261] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][262] +3 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][264] +3 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-bmg:          [DMESG-FAIL][265] ([Intel XE#3468]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_frontbuffer_tracking@basic.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [DMESG-WARN][267] -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2136]) -> [PASS][270] +10 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [DMESG-WARN][271] ([Intel XE#3466]) -> [PASS][272] +40 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-4/igt@kms_plane_cursor@primary.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@kms_plane_cursor@primary.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][273] ([Intel XE#1430]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2446]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_pm_rpm@legacy-planes.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1130]) -> [PASS][278] +89 other tests pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-basic:
    - shard-bmg:          [DMESG-WARN][279] -> [PASS][280] +1 other test pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-2/igt@xe_exec_balancer@no-exec-cm-parallel-basic.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-1/igt@xe_exec_balancer@no-exec-cm-parallel-basic.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-FAIL][281] ([Intel XE#3371]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-436/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          [DMESG-FAIL][283] ([Intel XE#3466]) -> [PASS][284] +4 other tests pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-4/igt@xe_live_ktest@xe_bo.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [DMESG-WARN][285] ([Intel XE#3086]) -> [PASS][286] +4 other tests pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][287] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][289] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][291] ([Intel XE#958]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
    - shard-lnl:          [FAIL][293] ([Intel XE#958]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@large-split-binds-2147483648:
    - shard-bmg:          [DMESG-WARN][295] ([Intel XE#3468]) -> [PASS][296] +8 other tests pass
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_vm@large-split-binds-2147483648.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@xe_vm@large-split-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][297] ([Intel XE#1033] / [Intel XE#3086]) -> [ABORT][298] ([Intel XE#1033])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#873]) -> [SKIP][300] ([Intel XE#2423] / [i915#2575])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-dg2-set2:     [DMESG-WARN][301] ([Intel XE#3468]) -> [SKIP][302] ([Intel XE#2423] / [i915#2575])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_atomic_interruptible@atomic-setmode.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#455]) -> [SKIP][304] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][306] ([Intel XE#316])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][307] ([Intel XE#3468]) -> [DMESG-WARN][308] ([Intel XE#3468]) +2 other tests dmesg-warn
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#316]) -> [SKIP][310] ([Intel XE#2136]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2136]) -> [SKIP][312] ([Intel XE#316]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][313] ([Intel XE#1033]) -> [DMESG-FAIL][314] ([Intel XE#324])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-FAIL][315] ([Intel XE#2705] / [Intel XE#3468]) -> [DMESG-WARN][316] ([Intel XE#2705] / [Intel XE#3468])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#1124]) +4 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][320] ([Intel XE#1124]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#619]) -> [SKIP][322] ([Intel XE#2136] / [Intel XE#2351])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2136]) -> [SKIP][324] ([Intel XE#610])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][325] ([Intel XE#1033]) -> [FAIL][326] ([Intel XE#3052])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][327] ([Intel XE#1033]) -> [FAIL][328] ([Intel XE#1874]) +11 other tests fail
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][329] ([Intel XE#1033]) -> [FAIL][330] ([Intel XE#1231] / [Intel XE#1242]) +1 other test fail
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1124]) -> [SKIP][332] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#607]) -> [SKIP][334] ([Intel XE#2136])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1124]) -> [SKIP][336] ([Intel XE#2136]) +3 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2423] / [i915#2575]) -> [SKIP][338] ([Intel XE#367])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2191]) -> [SKIP][340] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2423] / [i915#2575]) -> [SKIP][342] ([Intel XE#2191])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#367]) -> [SKIP][344] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][346] ([Intel XE#2136]) +8 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2907]) -> [SKIP][348] ([Intel XE#2136]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][350] ([Intel XE#2136] / [Intel XE#2351])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2136]) -> [SKIP][352] ([Intel XE#2907]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][354] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2136]) -> [SKIP][356] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2423] / [i915#2575]) -> [SKIP][358] ([Intel XE#306]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_chamelium_color@gamma.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#373]) -> [SKIP][360] ([Intel XE#2423] / [i915#2575]) +7 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2423] / [i915#2575]) -> [SKIP][362] ([Intel XE#373]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_chamelium_frames@vga-frame-dump.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][363] ([Intel XE#2341]) -> [FAIL][364] ([Intel XE#1178])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_content_protection@atomic.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2423] / [i915#2575]) -> [SKIP][366] ([Intel XE#307])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][367] ([Intel XE#1178]) -> [SKIP][368] ([Intel XE#2423] / [i915#2575])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_content_protection@legacy.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2423] / [i915#2575]) -> [SKIP][370] ([Intel XE#308]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#307]) -> [SKIP][372] ([Intel XE#2423] / [i915#2575])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2351]) -> [SKIP][374] ([Intel XE#455])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_dsc@dsc-basic.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#701]) -> [SKIP][376] ([Intel XE#2423] / [i915#2575])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [ABORT][377] -> [SKIP][378] ([Intel XE#1137])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2423] / [i915#2575]) -> [FAIL][380] ([Intel XE#301])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][381] ([Intel XE#301]) -> [SKIP][382] ([Intel XE#2423] / [i915#2575])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2136]) -> [SKIP][384] ([Intel XE#455]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#455]) -> [SKIP][386] ([Intel XE#2136]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][388] ([Intel XE#455]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][389] ([Intel XE#1033] / [Intel XE#324]) -> [DMESG-FAIL][390] ([Intel XE#324]) +3 other tests dmesg-fail
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#455]) -> [SKIP][392] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2136]) -> [SKIP][394] ([Intel XE#651]) +9 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][395] ([Intel XE#2312]) -> [SKIP][396] ([Intel XE#2311]) +5 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][397] ([Intel XE#2311]) -> [SKIP][398] ([Intel XE#2312]) +8 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][400] ([Intel XE#651]) +2 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-FAIL][401] ([Intel XE#1033]) -> [FAIL][402] ([Intel XE#1861]) +6 other tests fail
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     [INCOMPLETE][403] -> [SKIP][404] ([Intel XE#2136] / [Intel XE#2351])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [FAIL][405] ([Intel XE#2333]) -> [SKIP][406] ([Intel XE#2312]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [DMESG-FAIL][407] ([Intel XE#3468]) -> [SKIP][408] ([Intel XE#2312])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][409] ([Intel XE#2312]) -> [FAIL][410] ([Intel XE#2333])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#651]) -> [SKIP][412] ([Intel XE#2136]) +14 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#651]) -> [SKIP][414] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#653]) -> [SKIP][416] ([Intel XE#2136]) +16 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][417] ([Intel XE#2312]) -> [SKIP][418] ([Intel XE#2313]) +7 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][419] ([Intel XE#2313]) -> [SKIP][420] ([Intel XE#2312]) +7 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#653]) -> [SKIP][422] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][424] ([Intel XE#653]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2136]) -> [SKIP][426] ([Intel XE#653]) +15 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2136]) -> [SKIP][428] ([Intel XE#2925])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2927]) -> [SKIP][430] ([Intel XE#2136])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2423] / [i915#2575]) -> [SKIP][432] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][434] ([Intel XE#2423] / [i915#2575])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2136]) -> [SKIP][436] ([Intel XE#2938])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#2136]) -> [SKIP][438] ([Intel XE#870]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1122]) -> [SKIP][440] ([Intel XE#2136] / [Intel XE#2351])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#908]) -> [SKIP][442] ([Intel XE#2136] / [Intel XE#2351])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][443] ([Intel XE#734]) -> [FAIL][444] ([Intel XE#3325])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-set2:     [DMESG-WARN][445] ([Intel XE#3468]) -> [SKIP][446] ([Intel XE#2446])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_pm_rpm@dpms-lpsp.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#2446]) -> [ABORT][448] ([Intel XE#3468])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2446]) -> [INCOMPLETE][450] ([Intel XE#2864] / [Intel XE#3468])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1489]) -> [SKIP][452] ([Intel XE#2136]) +5 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#2136]) -> [SKIP][454] ([Intel XE#1489]) +2 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1122]) -> [SKIP][456] ([Intel XE#2136])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][458] ([Intel XE#2136]) +6 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][460] ([Intel XE#2850] / [Intel XE#929])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-blt.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][462] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_psr@psr-cursor-render.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#2136]) -> [SKIP][464] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_psr@psr2-sprite-plane-move.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#2423] / [i915#2575]) -> [SKIP][466] ([Intel XE#3414])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#2423] / [i915#2575]) -> [SKIP][468] ([Intel XE#1127])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][469] ([Intel XE#1729]) -> [SKIP][470] ([Intel XE#2426])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][471] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][472] ([Intel XE#2423] / [i915#2575])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#2423] / [i915#2575]) -> [SKIP][474] ([Intel XE#455]) +3 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_vrr@flip-dpms.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@kms_vrr@flip-dpms.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1130]) -> [SKIP][476] ([Intel XE#1280] / [Intel XE#455])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1126]) -> [SKIP][478] ([Intel XE#1130])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@discovery-empty:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#2905]) -> [SKIP][480] ([Intel XE#1130]) +6 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_eudebug@discovery-empty.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#1130]) -> [SKIP][482] ([Intel XE#2905]) +4 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_eudebug@multigpu-basic-client-many.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1130]) -> [FAIL][484] ([Intel XE#1600]) +1 other test fail
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1130]) -> [DMESG-WARN][486] ([Intel XE#1727]) +1 other test dmesg-warn
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#1130]) -> [SKIP][488] ([Intel XE#288]) +15 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#288]) -> [SKIP][490] ([Intel XE#1130]) +18 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#2360]) -> [SKIP][492] ([Intel XE#1130]) +1 other test skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-adlp:         [DMESG-WARN][493] ([Intel XE#3343]) -> [DMESG-WARN][494] ([Intel XE#3086] / [Intel XE#3343])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [DMESG-WARN][495] ([Intel XE#3086] / [Intel XE#3343]) -> [DMESG-WARN][496] ([Intel XE#3343])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1130]) -> [DMESG-WARN][498] ([Intel XE#3467])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1130]) -> [DMESG-WARN][500] ([Intel XE#3343])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [DMESG-WARN][501] ([Intel XE#3343]) -> [SKIP][502] ([Intel XE#1130])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     [DMESG-WARN][503] ([Intel XE#3467]) -> [SKIP][504] ([Intel XE#1130])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][505] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-FAIL][506] ([Intel XE#3467]) +1 other test dmesg-fail
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [DMESG-WARN][507] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][508] ([Intel XE#3467])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][509] ([Intel XE#3467]) -> [DMESG-WARN][510] ([Intel XE#3467] / [Intel XE#3468])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#560]) -> [SKIP][512] ([Intel XE#1130])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@xe_media_fill@media-fill.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#2541]) -> [SKIP][514] ([Intel XE#1130]) +4 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1130]) -> [SKIP][516] ([Intel XE#2541]) +4 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][518] ([Intel XE#1130]) +2 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#1130]) -> [DMESG-WARN][520] ([Intel XE#3468])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@xe_pm@d3hot-basic-exec.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][521] ([Intel XE#3468]) -> [SKIP][522] ([Intel XE#1130])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_pm@d3hot-multiple-execs.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][523] ([Intel XE#3468] / [Intel XE#569]) -> [SKIP][524] ([Intel XE#1130])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [DMESG-WARN][525] ([Intel XE#3466]) -> [ABORT][526] ([Intel XE#1358] / [Intel XE#1607])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-4/igt@xe_pm@s4-exec-after.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#1130]) -> [DMESG-WARN][528] ([Intel XE#1727] / [Intel XE#3088] / [Intel XE#3468])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#944]) -> [SKIP][530] ([Intel XE#1130]) +2 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1130]) -> [SKIP][532] ([Intel XE#944]) +1 other test skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99 -> xe-pw-141521v2

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99: 0cb17ecec562c61d45997a2fced4e5ed99b31f99
  xe-pw-141521v2: 141521v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v2/index.html
