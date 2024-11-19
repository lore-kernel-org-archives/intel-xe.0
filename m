Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCA8D44159
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 13:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1CF10E27B;
	Tue, 19 Nov 2024 13:04:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9DB10E27B;
 Tue, 19 Nov 2024 13:04:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5270987099812718452=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/xe3=3A_FBC_Dirty_rect_?=
 =?utf-8?q?feature_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 13:04:24 -0000
Message-ID: <173202146483.320875.13746108714684211883@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118235325.353010-1-vinod.govindapillai@intel.com>
In-Reply-To: <20241118235325.353010-1-vinod.govindapillai@intel.com>
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

--===============5270987099812718452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe3: FBC Dirty rect feature support
URL   : https://patchwork.freedesktop.org/series/141526/
State : failure

== Summary ==

CI Bug Log - changes from xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6_full -> xe-pw-141526v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141526v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141526v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141526v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +2 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +6 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs:
    - shard-bmg:          [PASS][6] -> [DMESG-FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][10] -> [DMESG-WARN][11] +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-7/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_vm@bind-once:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][12] +2 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_vm@bind-once.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][13] ([Intel XE#877]) -> [DMESG-WARN][14] +2 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][15] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][16] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [DMESG-FAIL][17] ([Intel XE#3468]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][19] ([Intel XE#3309]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [SKIP][21] ([Intel XE#2446]) -> [DMESG-WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][23] ([Intel XE#1727]) -> [DMESG-WARN][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-dg2-set2:     [SKIP][25] ([Intel XE#1130]) -> [DMESG-WARN][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][27] ([Intel XE#3468]) -> [DMESG-WARN][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html

  
Known issues
------------

  Here are the changes found in xe-pw-141526v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][29] -> [FAIL][30] ([Intel XE#3440])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@core_getversion@all-cards.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@core_getversion@all-cards.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#3440])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#1885]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@core_hotunplug@hotunplug-rescan.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2134]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@fbdev@eof.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#1701]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2423] / [i915#2575]) +72 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2370])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1124])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#316])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1124])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1124])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2314] / [Intel XE#2894])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2314] / [Intel XE#2894])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#367])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#787]) +11 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#3432])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#787]) +90 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][53] ([Intel XE#1195] / [Intel XE#3113])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1152]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#306]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_chamelium_color@ctm-negative.html
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2325])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#373]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd.html
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2252]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#373])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][60] ([Intel XE#1178]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-adlp:         [PASS][61] -> [DMESG-WARN][62] ([Intel XE#3086]) +7 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2321])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#308])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     [PASS][65] -> [SKIP][66] ([Intel XE#2423] / [i915#2575]) +138 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#309])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2291]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2244])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#703])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#310])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2316]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-plain-flip-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#886]) +6 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#3149] / [Intel XE#886]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:
    - shard-bmg:          [PASS][79] -> [FAIL][80] ([Intel XE#2882]) +2 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#2136]) +40 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][83] ([Intel XE#1195] / [Intel XE#1727]) +1 other test incomplete
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2136] / [Intel XE#2351]) +20 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#455]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2293] / [Intel XE#2380])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2293])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#2351])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#651]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#651]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#656]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2136]) +71 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2311]) +9 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][95] ([Intel XE#1033]) +3 other tests dmesg-fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#2136] / [Intel XE#2351]) +22 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> [FAIL][98] ([Intel XE#2333]) +2 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2313]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#653]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#653]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][102] -> [SKIP][103] ([Intel XE#455])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#3012])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> [FAIL][105] ([Intel XE#361]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2763]) +8 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [PASS][108] -> [SKIP][109] ([Intel XE#2446]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2446]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1489]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1489]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1489])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#3414])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#1435])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#455]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2426])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#899])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][124] -> [SKIP][125] ([Intel XE#2423])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@testdisplay.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1123])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2504])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#944])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2905]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#2905]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [PASS][131] -> [TIMEOUT][132] ([Intel XE#1473])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [PASS][133] -> [SKIP][134] ([Intel XE#1130]) +255 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-dg2-set2:     [PASS][135] -> [INCOMPLETE][136] ([Intel XE#1195])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-433/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1130]) +115 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2322]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][139] ([Intel XE#1727])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-4/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-fault:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#288]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html

  * igt@xe_exec_fault_mode@many-userptr-rebind:
    - shard-bmg:          [PASS][141] -> [DMESG-WARN][142] ([Intel XE#3468]) +4 other tests dmesg-warn
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-rebind.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#288]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2360])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][145] -> [DMESG-WARN][146] ([Intel XE#3184])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#255])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][148] -> [SKIP][149] ([Intel XE#2229]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#2541]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@stress-open-close@rcs-0:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][151] ([Intel XE#3466]) +1 other test dmesg-warn
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-1/igt@xe_oa@stress-open-close@rcs-0.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2284])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][153] ([Intel XE#3468])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][154] -> [ABORT][155] ([Intel XE#1607] / [Intel XE#1794])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#3342])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-adlp:         [PASS][157] -> [FAIL][158] ([Intel XE#3507])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@xe_sriov_flr@flr-each-isolation.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-8/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@core_getstats:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#2423]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_getstats.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@core_getstats.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1885]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#3453]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#2134]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@fbdev@write.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-464/igt@fbdev@write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][167] ([Intel XE#1426]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
    - shard-bmg:          [DMESG-FAIL][169] ([Intel XE#2705]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][171] ([Intel XE#3321] / [Intel XE#3486]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [FAIL][173] ([Intel XE#2882]) -> [PASS][174] +2 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][175] ([Intel XE#3468]) -> [PASS][176] +57 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#2423] / [i915#2575]) -> [PASS][178] +62 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][179] ([Intel XE#886]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][181] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][182] +2 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-lnl:          [DMESG-WARN][183] ([Intel XE#2932]) -> [PASS][184] +2 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-8/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][185] ([Intel XE#3468]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][188] +4 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2136]) -> [PASS][190] +16 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-adlp:         [DMESG-WARN][191] ([Intel XE#3086]) -> [PASS][192] +4 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-bmg:          [DMESG-WARN][193] ([Intel XE#2566]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2446]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][197] ([Intel XE#899]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [DMESG-FAIL][199] ([Intel XE#3468]) -> [PASS][200] +9 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_vblank@wait-busy-hang.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_vblank@wait-busy-hang.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [FAIL][201] ([Intel XE#2667]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1130]) -> [PASS][204] +92 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][205] ([Intel XE#1727]) -> [PASS][206] +4 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr:
    - shard-bmg:          [DMESG-WARN][207] ([Intel XE#2705]) -> [PASS][208] +2 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][209] ([Intel XE#3467]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][211] ([Intel XE#2998]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][213] ([Intel XE#2136]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_module_load@reload.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_module_load@reload.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][215] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-9/igt@xe_pm@s4-basic.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][217] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][219] ([Intel XE#2280]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_vm@large-split-binds-2147483648:
    - shard-bmg:          [DMESG-WARN][221] -> [PASS][222] +2 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@xe_vm@large-split-binds-2147483648.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-7/igt@xe_vm@large-split-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2-set2:     [DMESG-FAIL][223] ([Intel XE#3468]) -> [SKIP][224] ([Intel XE#2423] / [i915#2575])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic@test-only:
    - shard-dg2-set2:     [DMESG-WARN][225] ([Intel XE#1727]) -> [SKIP][226] ([Intel XE#2423] / [i915#2575])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_atomic@test-only.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_atomic@test-only.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [DMESG-FAIL][227] ([Intel XE#3466]) -> [DMESG-WARN][228] ([Intel XE#3466]) +1 other test dmesg-warn
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][230] ([Intel XE#316])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [INCOMPLETE][231] ([Intel XE#3225]) -> [INCOMPLETE][232] ([Intel XE#3225] / [Intel XE#3466]) +3 other tests incomplete
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2136]) -> [SKIP][234] ([Intel XE#316]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#316]) -> [SKIP][236] ([Intel XE#2136] / [Intel XE#2351])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#316]) -> [SKIP][238] ([Intel XE#2136]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1124]) -> [SKIP][240] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2136]) -> [SKIP][242] ([Intel XE#1124]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#607]) -> [SKIP][244] ([Intel XE#2136] / [Intel XE#2351])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1124]) -> [SKIP][246] ([Intel XE#2136]) +9 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][248] ([Intel XE#1124]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#610]) -> [SKIP][250] ([Intel XE#2136])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#367]) -> [SKIP][252] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2423] / [i915#2575]) -> [SKIP][254] ([Intel XE#2191]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2191]) -> [SKIP][256] ([Intel XE#2423] / [i915#2575])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2423] / [i915#2575]) -> [SKIP][258] ([Intel XE#367]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2136]) -> [SKIP][260] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][262] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][264] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][265] ([Intel XE#1195]) -> [SKIP][266] ([Intel XE#2136]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2136]) -> [INCOMPLETE][268] ([Intel XE#1195]) +1 other test incomplete
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2907]) -> [SKIP][270] ([Intel XE#2136]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][272] ([Intel XE#2136]) +12 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2423] / [i915#2575]) -> [SKIP][274] ([Intel XE#306])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#306]) -> [SKIP][276] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_chamelium_color@gamma.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#373]) -> [SKIP][278] ([Intel XE#2423] / [i915#2575]) +18 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2423] / [i915#2575]) -> [SKIP][280] ([Intel XE#373]) +6 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2423] / [i915#2575]) -> [SKIP][282] ([Intel XE#307])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][283] ([Intel XE#1178]) -> [SKIP][284] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][285] ([Intel XE#1188]) -> [SKIP][286] ([Intel XE#2423] / [i915#2575])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@uevent.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_content_protection@uevent.html
    - shard-bmg:          [DMESG-FAIL][287] ([Intel XE#3468]) -> [SKIP][288] ([Intel XE#2341])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_content_protection@uevent.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#308]) -> [SKIP][290] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2423] / [i915#2575]) -> [SKIP][292] ([Intel XE#308])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2423] / [i915#2575]) -> [SKIP][294] ([Intel XE#455]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-bmg:          [DMESG-FAIL][295] ([Intel XE#3468]) -> [DMESG-WARN][296] ([Intel XE#3468]) +5 other tests dmesg-warn
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][297] ([Intel XE#877]) -> [SKIP][298] ([Intel XE#2291])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [DMESG-WARN][299] ([Intel XE#3468]) -> [SKIP][300] ([Intel XE#2291])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#323]) -> [SKIP][302] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2351]) -> [SKIP][304] ([Intel XE#455])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_dsc@dsc-basic.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][306] ([Intel XE#455]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2423] / [i915#2575]) -> [SKIP][308] ([Intel XE#1135])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][309] ([Intel XE#3468]) -> [SKIP][310] ([Intel XE#2316])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][311] ([Intel XE#301]) -> [SKIP][312] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-FAIL][313] ([Intel XE#1727]) -> [SKIP][314] ([Intel XE#2423] / [i915#2575])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#455]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#455]) -> [SKIP][318] ([Intel XE#2136] / [Intel XE#2351])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][319] ([Intel XE#1033] / [Intel XE#324]) -> [DMESG-FAIL][320] ([Intel XE#1033] / [Intel XE#3086] / [Intel XE#324]) +1 other test dmesg-fail
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#455]) -> [SKIP][322] ([Intel XE#2136]) +9 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          [DMESG-FAIL][323] ([Intel XE#3468]) -> [DMESG-FAIL][324] ([Intel XE#2705])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][325] ([i915#5274]) -> [SKIP][326] ([Intel XE#2423] / [i915#2575])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][328] ([Intel XE#651]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][329] ([Intel XE#3468]) -> [FAIL][330] ([Intel XE#2333]) +1 other test fail
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][331] ([Intel XE#2050]) -> [FAIL][332] ([Intel XE#2333])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [DMESG-FAIL][333] ([Intel XE#3468]) -> [SKIP][334] ([Intel XE#2312]) +4 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][335] ([Intel XE#2333]) -> [SKIP][336] ([Intel XE#2312]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#651]) -> [SKIP][338] ([Intel XE#2136]) +28 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][339] ([Intel XE#2311]) -> [SKIP][340] ([Intel XE#2312]) +17 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2136]) -> [SKIP][342] ([Intel XE#651]) +13 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#651]) -> [SKIP][344] ([Intel XE#2136] / [Intel XE#2351]) +19 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#658]) -> [SKIP][346] ([Intel XE#2136] / [Intel XE#2351])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2136]) -> [SKIP][348] ([Intel XE#653]) +15 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][349] ([Intel XE#2313]) -> [SKIP][350] ([Intel XE#2312]) +16 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][352] ([Intel XE#653]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#653]) -> [SKIP][354] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#653]) -> [SKIP][356] ([Intel XE#2136]) +39 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#605]) -> [SKIP][358] ([Intel XE#2423] / [i915#2575])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2-set2:     [DMESG-WARN][359] ([Intel XE#3468]) -> [SKIP][360] ([Intel XE#2423] / [i915#2575])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_hdr@static-toggle-suspend.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2925]) -> [SKIP][362] ([Intel XE#2136])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2927]) -> [SKIP][364] ([Intel XE#2136]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2423] / [i915#2575]) -> [SKIP][366] ([Intel XE#356])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
    - shard-bmg:          [DMESG-WARN][367] ([Intel XE#3468]) -> [DMESG-FAIL][368] ([Intel XE#3468]) +2 other tests dmesg-fail
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-3/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][370] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2423] / [i915#2575]) -> [SKIP][372] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#870]) -> [SKIP][374] ([Intel XE#2136])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2136]) -> [SKIP][376] ([Intel XE#2938])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2136]) -> [SKIP][378] ([Intel XE#870])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#1122]) -> [SKIP][380] ([Intel XE#2136] / [Intel XE#2351])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#1129]) -> [SKIP][382] ([Intel XE#2136] / [Intel XE#2351])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [ABORT][383] ([Intel XE#1727]) -> [DMESG-WARN][384] ([Intel XE#1727])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#1489]) -> [SKIP][386] ([Intel XE#2136]) +13 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2136]) -> [SKIP][388] ([Intel XE#1489]) +6 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#1122]) -> [SKIP][390] ([Intel XE#2136]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#2136]) -> [SKIP][392] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][394] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][396] ([Intel XE#2136]) +18 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][398] ([Intel XE#2351]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][400] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2423] / [i915#2575]) -> [SKIP][402] ([Intel XE#3414])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#3414]) -> [SKIP][404] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#1127]) -> [SKIP][406] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1500]) -> [SKIP][408] ([Intel XE#2423] / [i915#2575])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#330]) -> [SKIP][410] ([Intel XE#2423] / [i915#2575])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2168]) -> [SKIP][412] ([Intel XE#2423] / [i915#2575])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_vrr@cmrr.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#455]) -> [SKIP][414] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_vrr@flip-dpms.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#756]) -> [SKIP][416] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2423] / [i915#2575]) -> [SKIP][418] ([Intel XE#1091] / [Intel XE#2849])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][420] ([Intel XE#1130]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1130]) -> [SKIP][422] ([Intel XE#1126])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1126]) -> [SKIP][424] ([Intel XE#1130])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1130]) -> [SKIP][426] ([Intel XE#2905]) +5 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_eudebug_online@debugger-reopen.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#1130]) -> [SKIP][428] ([Intel XE#288]) +16 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#288]) -> [SKIP][430] ([Intel XE#1130]) +42 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2360]) -> [SKIP][432] ([Intel XE#1130])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1130]) -> [SKIP][434] ([Intel XE#2360])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2905]) -> [SKIP][436] ([Intel XE#1130]) +20 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [DMESG-WARN][437] ([Intel XE#3343]) -> [SKIP][438] ([Intel XE#1130])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1130]) -> [DMESG-WARN][440] ([Intel XE#3343])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1130]) -> [DMESG-WARN][442] ([Intel XE#3467])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-dg2-set2:     [DMESG-WARN][443] ([Intel XE#3467]) -> [SKIP][444] ([Intel XE#1130]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][445] ([Intel XE#2961] / [Intel XE#3191]) -> [INCOMPLETE][446] ([Intel XE#1195]) +1 other test incomplete
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1130]) -> [SKIP][448] ([Intel XE#2541]) +5 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2541]) -> [SKIP][450] ([Intel XE#1130]) +12 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_oa@polling-small-buf.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][452] ([Intel XE#1130])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][453] ([Intel XE#1173]) -> [SKIP][454] ([Intel XE#1061]) +1 other test skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_peer2peer@read.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][456] ([Intel XE#1130]) +3 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1130]) -> [SKIP][458] ([Intel XE#2284])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [DMESG-FAIL][459] ([Intel XE#3468]) -> [SKIP][460] ([Intel XE#1130])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_pm@s2idle-mocs.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#1130]) -> [DMESG-WARN][462] ([Intel XE#569])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][463] ([Intel XE#1727]) -> [SKIP][464] ([Intel XE#1130]) +2 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][465] ([Intel XE#2280]) -> [SKIP][466] ([Intel XE#1130])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#944]) -> [SKIP][468] ([Intel XE#1130]) +3 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#1130]) -> [SKIP][470] ([Intel XE#944]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#1130]) -> [FAIL][472] ([Intel XE#2922])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_tlb@basic-tlb.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_tlb@basic-tlb.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][473] ([Intel XE#2919]) -> [SKIP][474] ([Intel XE#1130])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_wedged@basic-wedged.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1130]) -> [ABORT][476] ([Intel XE#3421])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][477] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][478] ([Intel XE#1130])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
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
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3507
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 -> xe-pw-141526v1

  IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
  xe-pw-141526v1: 141526v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/index.html

--===============5270987099812718452==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe3: FBC Dirty rect feature support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141526/">https://patchwork.freedesktop.org/series/141526/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6_full -&gt; xe-pw-141526v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141526v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141526v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141526v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-hdmi-a-3.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@xe_ccs@large-ctrl-surf-copy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-7/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_vm@bind-once.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141526v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +72 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-right-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +138 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-plain-flip-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +255 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-433/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +115 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-4/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-1/igt@xe_oa@stress-open-close@rcs-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-8/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3507">Intel XE#3507</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@core_getstats.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-464/igt@fbdev@write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html">PASS</a> +57 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +62 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-8/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_vblank@wait-busy-hang.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_vblank@wait-busy-hang.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html">PASS</a> +92 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-2/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2147483648:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@xe_vm@large-split-binds-2147483648.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-7/igt@xe_vm@large-split-binds-2147483648.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_atomic@test-only.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_atomic@test-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-top-edge.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_hdr@static-toggle-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-bmg-3/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_pm@s2idle-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_pm@s2idle-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_tlb@basic-tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-463/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-434/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141526v1/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 -&gt; xe-pw-141526v1</li>
</ul>
<p>IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6<br />
  xe-pw-141526v1: 141526v1</p>

</body>
</html>

--===============5270987099812718452==--
