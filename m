Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C096DD75BCD
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 08:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD4210E410;
	Thu, 21 Nov 2024 08:25:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AA110E410;
 Thu, 21 Nov 2024 08:25:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Add_devcoredump_?=
 =?utf-8?q?locking_and_reason_string?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Nov 2024 08:25:52 -0000
Message-ID: <173217755210.1047576.10265782394184522341@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Add devcoredump locking and reason string
URL   : https://patchwork.freedesktop.org/series/141628/
State : failure

== Summary ==

CI Bug Log - changes from xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99_full -> xe-pw-141628v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141628v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141628v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141628v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-lnl:          [ABORT][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-8/igt@core_hotunplug@hotreplug.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-6/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][7] ([Intel XE#911]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#1130]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  
New tests
---------

  New tests have been introduced between xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99_full and xe-pw-141628v1_full:

### New IGT tests (12) ###

  * igt@kms_color@deep-color@pipe-a-hdmi-a-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [22.66] s

  * igt@kms_color@deep-color@pipe-a-hdmi-a-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.62] s

  * igt@kms_color@deep-color@pipe-a-hdmi-a-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.66] s

  * igt@kms_color@deep-color@pipe-b-hdmi-a-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [22.59] s

  * igt@kms_color@deep-color@pipe-b-hdmi-a-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.59] s

  * igt@kms_color@deep-color@pipe-b-hdmi-a-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.67] s

  * igt@kms_color@deep-color@pipe-c-hdmi-a-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [22.61] s

  * igt@kms_color@deep-color@pipe-c-hdmi-a-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.60] s

  * igt@kms_color@deep-color@pipe-c-hdmi-a-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.70] s

  * igt@kms_color@deep-color@pipe-d-hdmi-a-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [22.64] s

  * igt@kms_color@deep-color@pipe-d-hdmi-a-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.61] s

  * igt@kms_color@deep-color@pipe-d-hdmi-a-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.70] s

  

Known issues
------------

  Here are the changes found in xe-pw-141628v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     NOTRUN -> [FAIL][11] ([Intel XE#3440])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#1885])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@core_hotunplug@hotrebind-lateclose.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][14] ([Intel XE#3468])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@info:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#2134])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@fbdev@info.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#827]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][18] -> [SKIP][19] ([Intel XE#2423] / [i915#2575]) +36 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][20] ([Intel XE#1874])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#610])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#610])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1124]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#2191]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2314] / [Intel XE#2894])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2314] / [Intel XE#2894])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2191])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1512])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#367])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#367])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#367])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#367])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2907])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#787]) +26 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#3442])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2887]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +76 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2887]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2325])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_chamelium_color@degamma.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#306])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#373]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#373]) +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2252]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#373]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#3278])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][55] ([Intel XE#1178])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#307])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2320])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#308]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#308])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2321])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2321])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1424]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#309]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2291]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#309])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2291])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#2423]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_dp_aux_dev.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#3070])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#3070])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2244])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#776])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2423] / [i915#2575]) +27 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][75] -> [FAIL][76] ([Intel XE#2882]) +2 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][77] -> [FAIL][78] ([Intel XE#3486])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][79] -> [FAIL][80] ([Intel XE#3486])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#3321] / [Intel XE#3486])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][83] -> [FAIL][84] ([Intel XE#3321] / [Intel XE#3486])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][85] -> [FAIL][86] ([Intel XE#301]) +4 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#310]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#2316]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2316]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1421]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][92] -> [DMESG-WARN][93] ([Intel XE#2953] / [Intel XE#3086])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#3149] / [Intel XE#886])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#886])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@c-edp1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][98] ([Intel XE#3468])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293] / [Intel XE#2380])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1401]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2293])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#455]) +14 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#651]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2311]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [FAIL][108] ([Intel XE#2333]) +2 other tests fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#656]) +22 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#656]) +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2136]) +9 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#651]) +7 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#651]) +8 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1151])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2313]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#653]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#653]) +8 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#658])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2136]) +26 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2312]) +9 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#1503])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1503])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@pixel-format@pipe-b-plane-3:
    - shard-bmg:          [PASS][125] -> [DMESG-WARN][126] ([Intel XE#877]) +1 other test dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_plane@pixel-format@pipe-b-plane-3.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_plane@pixel-format@pipe-b-plane-3.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][127] ([Intel XE#616]) +2 other tests fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#455]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#599])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2393])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][131] -> [SKIP][132] ([Intel XE#2571])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#2763]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2763] / [Intel XE#455])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#2763]) +8 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2499])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2446])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#836])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][140] -> [SKIP][141] ([Intel XE#2446]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1489]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#2893]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#1489]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1489]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#1122])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1406]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#2351])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_psr@psr2-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#2939])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#3414]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#3414])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][155] -> [SKIP][156] ([Intel XE#1435])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2426])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#362])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][159] -> [FAIL][160] ([Intel XE#899])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@query-busy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][161] ([Intel XE#1727] / [Intel XE#3468])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-4/igt@kms_vblank@query-busy@pipe-a-dp-2.html

  * igt@kms_vblank@query-forked:
    - shard-bmg:          [PASS][162] -> [DMESG-FAIL][163] ([Intel XE#3468]) +1 other test dmesg-fail
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_vblank@query-forked.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_vblank@query-forked.html

  * igt@kms_vblank@query-forked@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][164] ([Intel XE#3468])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_vblank@query-forked@pipe-a-dp-2.html

  * igt@kms_vblank@query-forked@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][165] ([Intel XE#3468]) +11 other tests dmesg-warn
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_vblank@query-forked@pipe-d-dp-2.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][166] -> [SKIP][167] ([Intel XE#1499])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_vrr@negative-basic.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#1499])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#756]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#756]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#2423]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][172] ([Intel XE#1123])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#1123])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#1126])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][175] -> [FAIL][176] ([Intel XE#2667])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          [PASS][177] -> [DMESG-WARN][178] ([Intel XE#3468]) +12 other tests dmesg-warn
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#2905]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         NOTRUN -> [SKIP][180] ([Intel XE#2905]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#2905]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#2905]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][183] -> [TIMEOUT][184] ([Intel XE#1473])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#688]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][187] ([Intel XE#688]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][188] -> [SKIP][189] ([Intel XE#1130]) +69 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#2322]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#1392])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#1392]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
    - shard-bmg:          [PASS][193] -> [DMESG-WARN][194] ([Intel XE#1727])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#288]) +13 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#288]) +7 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr:
    - shard-bmg:          [PASS][197] -> [FAIL][198] ([Intel XE#3535])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [PASS][199] -> [DMESG-FAIL][200] ([Intel XE#3371])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][201] ([Intel XE#3467])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
    - shard-bmg:          NOTRUN -> [FAIL][202] ([Intel XE#3499] / [Intel XE#3539])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][203] -> [TIMEOUT][204] ([Intel XE#2961] / [Intel XE#3191]) +1 other test timeout
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#2229]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][206] -> [DMESG-WARN][207] ([Intel XE#3467])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_module_load@many-reload.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-1/igt@xe_module_load@many-reload.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][208] ([Intel XE#2541]) +4 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#2541])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#2236])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#979])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#979])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][213] ([Intel XE#2284] / [Intel XE#366])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@xe_pm@d3cold-mmap-system.html
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2284])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@xe_pm@d3cold-multiple-execs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#2284] / [Intel XE#366])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#1130]) +54 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][218] ([Intel XE#1727] / [Intel XE#3468])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][219] -> [ABORT][220] ([Intel XE#1794]) +1 other test abort
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-6/igt@xe_pm@s4-mocs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][221] -> [ABORT][222] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][223] -> [ABORT][224] ([Intel XE#1794])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#944])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-query.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#944])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-query.html
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#944])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     NOTRUN -> [ABORT][228] ([Intel XE#3421])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [ABORT][229] -> [PASS][230] +2 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-2/igt@core_hotunplug@hotreplug.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-4/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-lnl:          [ABORT][231] -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-6/igt@core_hotunplug@hotunplug-rescan.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-2/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - shard-lnl:          [DMESG-WARN][233] ([Intel XE#3514]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-4/igt@kms_addfb_basic@bad-pitch-0.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-4/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-lnl:          [INCOMPLETE][235] ([Intel XE#3466]) -> [PASS][236] +1 other test pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-FAIL][237] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][239] ([Intel XE#1033]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2136]) -> [PASS][242] +15 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2423] / [i915#2575]) -> [PASS][244] +53 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][245] ([Intel XE#3468]) -> [PASS][246] +4 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][247] ([Intel XE#2291]) -> [PASS][248] +5 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-lnl:          [FAIL][249] ([Intel XE#1475]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][251] ([Intel XE#1340]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][253] ([Intel XE#3486]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][255] ([Intel XE#2316]) -> [PASS][256] +8 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][257] ([Intel XE#886]) -> [PASS][258] +1 other test pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][259] ([Intel XE#301]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][261] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][264] +8 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [DMESG-WARN][265] ([Intel XE#3466]) -> [PASS][266] +44 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-4/igt@kms_plane_cursor@primary.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-4/igt@kms_plane_cursor@primary.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2446]) -> [PASS][268] +1 other test pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][269] ([Intel XE#2042]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-41:
    - shard-lnl:          [DMESG-WARN][271] ([Intel XE#3184]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-5/igt@kms_pm_rpm@universal-planes@plane-41.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-41.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][273] ([Intel XE#899]) -> [PASS][274] +1 other test pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [FAIL][275] ([Intel XE#2364]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_evict@evict-large-multi-vm-cm.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-basic:
    - shard-bmg:          [DMESG-WARN][277] -> [PASS][278] +1 other test pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-2/igt@xe_exec_balancer@no-exec-cm-parallel-basic.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@xe_exec_balancer@no-exec-cm-parallel-basic.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1130]) -> [PASS][280] +90 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][281] ([Intel XE#3467]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          [DMESG-FAIL][283] ([Intel XE#3466]) -> [PASS][284] +9 other tests pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-4/igt@xe_live_ktest@xe_bo.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-4/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2229]) -> [PASS][286] +1 other test pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [DMESG-WARN][287] ([Intel XE#3086]) -> [PASS][288] +3 other tests pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][289] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][291] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_spin_batch@spin-batch:
    - shard-bmg:          [DMESG-WARN][293] ([Intel XE#3468]) -> [PASS][294] +20 other tests pass
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_spin_batch@spin-batch.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@xe_spin_batch@spin-batch.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1885]) -> [DMESG-WARN][296] ([Intel XE#3468] / [Intel XE#3521])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@core_hotunplug@hotreplug.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@core_hotunplug@hotreplug.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2423] / [i915#2575]) -> [SKIP][298] ([Intel XE#623])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][299] ([Intel XE#1033] / [Intel XE#3086]) -> [DMESG-WARN][300] ([Intel XE#1033])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-dg2-set2:     [DMESG-WARN][301] ([Intel XE#3468]) -> [SKIP][302] ([Intel XE#2423] / [i915#2575])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_atomic_interruptible@atomic-setmode.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][303] ([Intel XE#3468]) -> [DMESG-WARN][304] ([Intel XE#3468]) +5 other tests dmesg-warn
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][306] ([Intel XE#316])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2136]) -> [SKIP][308] ([Intel XE#316])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [DMESG-WARN][309] ([Intel XE#3468]) -> [DMESG-FAIL][310] ([Intel XE#3468])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][311] ([Intel XE#1033]) -> [DMESG-FAIL][312] ([Intel XE#324])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][313] ([Intel XE#1033]) -> [FAIL][314] ([Intel XE#1231] / [Intel XE#1242])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][316] ([Intel XE#607])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][317] ([Intel XE#1033]) -> [FAIL][318] ([Intel XE#3052])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][319] ([Intel XE#1033]) -> [FAIL][320] ([Intel XE#1874]) +11 other tests fail
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][321] ([Intel XE#1033]) -> [DMESG-WARN][322] ([Intel XE#324])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][324] ([Intel XE#1124]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1124]) -> [SKIP][326] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][328] ([Intel XE#619])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#607]) -> [SKIP][330] ([Intel XE#2136])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2136]) -> [SKIP][332] ([Intel XE#1124]) +4 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2423] / [i915#2575]) -> [SKIP][334] ([Intel XE#367]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#367]) -> [SKIP][336] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][338] ([Intel XE#2136] / [Intel XE#2351])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2136]) -> [SKIP][340] ([Intel XE#3442])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2136]) -> [SKIP][342] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][344] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][346] ([Intel XE#2136]) +7 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2423] / [i915#2575]) -> [SKIP][348] ([Intel XE#373]) +7 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_chamelium_audio@dp-audio.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#306]) -> [SKIP][350] ([Intel XE#2423] / [i915#2575])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#373]) -> [SKIP][352] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][353] ([Intel XE#2341]) -> [FAIL][354] ([Intel XE#1178])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_content_protection@atomic.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#307]) -> [SKIP][356] ([Intel XE#2423] / [i915#2575])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][357] ([Intel XE#1178]) -> [SKIP][358] ([Intel XE#2341])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@kms_content_protection@srm.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][359] ([Intel XE#1188]) -> [SKIP][360] ([Intel XE#2341])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_content_protection@uevent.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2423] / [i915#2575]) -> [SKIP][362] ([Intel XE#455]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][363] ([Intel XE#877]) -> [SKIP][364] ([Intel XE#2291]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2423] / [i915#2575]) -> [SKIP][366] ([Intel XE#323])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2136]) -> [SKIP][368] ([Intel XE#455])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#455]) -> [SKIP][370] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#455]) -> [SKIP][372] ([Intel XE#2136])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2136]) -> [SKIP][374] ([Intel XE#776])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [ABORT][375] -> [SKIP][376] ([Intel XE#1137])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][377] ([Intel XE#2316]) -> [DMESG-WARN][378] ([Intel XE#3468])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][379] ([Intel XE#2597] / [Intel XE#3468]) -> [SKIP][380] ([Intel XE#2316])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][382] ([Intel XE#3468])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][384] ([Intel XE#455])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][385] ([Intel XE#1033] / [Intel XE#324]) -> [DMESG-FAIL][386] ([Intel XE#324]) +3 other tests dmesg-fail
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][387] ([Intel XE#2311]) -> [SKIP][388] ([Intel XE#2312]) +15 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][389] ([Intel XE#2312]) -> [SKIP][390] ([Intel XE#2311]) +14 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#651]) -> [SKIP][392] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-FAIL][393] ([Intel XE#1033]) -> [FAIL][394] ([Intel XE#1861]) +6 other tests fail
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     [INCOMPLETE][395] -> [SKIP][396] ([Intel XE#2136] / [Intel XE#2351])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [FAIL][397] ([Intel XE#2333]) -> [DMESG-FAIL][398] ([Intel XE#3468])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-bmg:          [INCOMPLETE][399] ([Intel XE#3468]) -> [DMESG-FAIL][400] ([Intel XE#3468])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][401] ([Intel XE#2312]) -> [DMESG-FAIL][402] ([Intel XE#3468])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [DMESG-FAIL][403] ([Intel XE#3468]) -> [FAIL][404] ([Intel XE#2333]) +1 other test fail
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][405] ([Intel XE#2312]) -> [FAIL][406] ([Intel XE#2333]) +5 other tests fail
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][407] ([Intel XE#2333]) -> [SKIP][408] ([Intel XE#2312]) +6 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-bmg:          [INCOMPLETE][409] -> [INCOMPLETE][410] ([Intel XE#3468])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#651]) -> [SKIP][412] ([Intel XE#2136]) +8 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2136]) -> [SKIP][414] ([Intel XE#651]) +12 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][416] ([Intel XE#651]) +7 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#653]) -> [SKIP][418] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#653]) -> [SKIP][420] ([Intel XE#2136]) +11 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2136]) -> [SKIP][422] ([Intel XE#653]) +11 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][423] ([Intel XE#2312]) -> [SKIP][424] ([Intel XE#2313]) +16 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][425] ([Intel XE#2313]) -> [SKIP][426] ([Intel XE#2312]) +15 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][428] ([Intel XE#653]) +4 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2423] / [i915#2575]) -> [SKIP][430] ([Intel XE#605])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][431] ([Intel XE#3374]) -> [SKIP][432] ([Intel XE#3374] / [Intel XE#3544])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          [SKIP][433] ([Intel XE#3374]) -> [SKIP][434] ([Intel XE#3374] / [Intel XE#3544])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2925]) -> [SKIP][436] ([Intel XE#2136])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#2927]) -> [SKIP][438] ([Intel XE#2136])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#356]) -> [SKIP][440] ([Intel XE#2423] / [i915#2575])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#455]) -> [SKIP][442] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_panel_fitting@atomic-fastset.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#2423] / [i915#2575]) -> [FAIL][444] ([Intel XE#616])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_plane_cursor@primary.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#2423] / [i915#2575]) -> [SKIP][446] ([Intel XE#2763] / [Intel XE#455])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][448] ([Intel XE#2423] / [i915#2575])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2446]) -> [DMESG-WARN][450] ([Intel XE#3468])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1489]) -> [SKIP][452] ([Intel XE#2136]) +4 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#2136]) -> [SKIP][454] ([Intel XE#1489]) +4 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#2136]) -> [SKIP][456] ([Intel XE#1122])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][458] ([Intel XE#2136]) +3 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][460] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-render.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][462] ([Intel XE#2850] / [Intel XE#929])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_psr@pr-cursor-plane-move.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#2136]) -> [SKIP][464] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][466] ([Intel XE#2939])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#3414]) -> [SKIP][468] ([Intel XE#2423] / [i915#2575])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#2423] / [i915#2575]) -> [SKIP][470] ([Intel XE#1127])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][471] ([Intel XE#1729]) -> [SKIP][472] ([Intel XE#2426])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [DMESG-WARN][473] ([Intel XE#3468]) -> [INCOMPLETE][474] ([Intel XE#1727] / [Intel XE#3468])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@kms_vblank@query-busy.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-4/igt@kms_vblank@query-busy.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#2423] / [i915#2575]) -> [SKIP][476] ([Intel XE#756]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2905]) -> [SKIP][478] ([Intel XE#1130]) +4 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1130]) -> [SKIP][480] ([Intel XE#2905]) +6 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_eudebug_online@resume-dss.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_exec_balancer@many-execqueues-virtual-rebind:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#1130]) -> [DMESG-WARN][482] ([Intel XE#1727]) +1 other test dmesg-warn
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][483] ([Intel XE#3468]) -> [DMESG-WARN][484] ([Intel XE#1727])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1130]) -> [SKIP][486] ([Intel XE#288]) +13 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#288]) -> [SKIP][488] ([Intel XE#1130]) +11 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1130]) -> [SKIP][490] ([Intel XE#2360])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#2360]) -> [SKIP][492] ([Intel XE#1130])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [DMESG-WARN][493] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][494] ([Intel XE#3467])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][495] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][496] ([Intel XE#3343])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [DMESG-WARN][497] ([Intel XE#3343]) -> [DMESG-WARN][498] ([Intel XE#3343] / [Intel XE#3468])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1130]) -> [DMESG-WARN][500] ([Intel XE#3467]) +1 other test dmesg-warn
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][501] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-FAIL][502] ([Intel XE#3467])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][503] ([Intel XE#3467]) -> [DMESG-WARN][504] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [DMESG-WARN][505] ([Intel XE#3467]) -> [FAIL][506] ([Intel XE#3546])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_module_load@reload-no-display.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#1130]) -> [SKIP][508] ([Intel XE#2541]) +5 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#2541]) -> [SKIP][510] ([Intel XE#1130]) +3 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@xe_oa@invalid-create-userspace-config.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1130]) -> [SKIP][512] ([Intel XE#1337])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][513] ([Intel XE#1173]) -> [SKIP][514] ([Intel XE#1061])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-433/igt@xe_peer2peer@read.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-434/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1130]) -> [DMESG-WARN][516] ([Intel XE#3468])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@xe_pm@d3hot-mmap-system.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][517] ([Intel XE#3468]) -> [SKIP][518] ([Intel XE#1130])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_pm@d3hot-multiple-execs.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][519] ([Intel XE#3468] / [Intel XE#569]) -> [SKIP][520] ([Intel XE#1130])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [DMESG-WARN][521] ([Intel XE#3468]) -> [DMESG-FAIL][522] ([Intel XE#1727] / [Intel XE#3468])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#944]) -> [SKIP][524] ([Intel XE#1130]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#1130]) -> [SKIP][526] ([Intel XE#944]) +1 other test skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [DMESG-WARN][527] ([Intel XE#2919] / [Intel XE#3086]) -> [DMESG-WARN][528] ([Intel XE#2919])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-adlp-8/igt@xe_wedged@basic-wedged.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-adlp-8/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1130]) -> [ABORT][530] ([Intel XE#3075] / [Intel XE#3084])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
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
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3535
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99 -> xe-pw-141628v1

  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99: 0cb17ecec562c61d45997a2fced4e5ed99b31f99
  xe-pw-141628v1: 141628v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v1/index.html
