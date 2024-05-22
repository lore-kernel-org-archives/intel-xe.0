Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115B0C25B74
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 03:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB6010EDD4;
	Wed, 22 May 2024 03:08:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208310F1AE;
 Wed, 22 May 2024 03:08:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2807376684745882786=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Add_process_name_to_d?=
 =?utf-8?q?evcoredump_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 May 2024 03:08:43 -0000
Message-ID: <171634732345.2165803.10711100251104274072@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521183751.184773-1-jose.souza@intel.com>
In-Reply-To: <20240521183751.184773-1-jose.souza@intel.com>
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

--===============2807376684745882786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add process name to devcoredump (rev2)
URL   : https://patchwork.freedesktop.org/series/133887/
State : failure

== Summary ==

CI Bug Log - changes from xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6_full -> xe-pw-133887v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133887v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133887v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133887v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-adlp:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [ABORT][2] +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4] +2 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@xe_exec_reset@parallel-close-fd-no-exec:
    - shard-adlp:         [PASS][5] -> [ABORT][6] +3 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-2/igt@xe_exec_reset@parallel-close-fd-no-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_exec_reset@parallel-close-fd-no-exec.html

  
#### Warnings ####

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#1201]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#1201] / [Intel XE#653]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_vblank@query-idle-hang:
    - {shard-lnl}:        [PASS][11] -> [ABORT][12] +5 other tests abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-6/igt@kms_vblank@query-idle-hang.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-4/igt@kms_vblank@query-idle-hang.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
    - {shard-lnl}:        [PASS][13] -> [INCOMPLETE][14] +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html

  * igt@xe_evict@evict-large-multi-vm:
    - {shard-lnl}:        [SKIP][15] ([Intel XE#688]) -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-8/igt@xe_evict@evict-large-multi-vm.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-6/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][17]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-6/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - {shard-lnl}:        NOTRUN -> [ABORT][18]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  
New tests
---------

  New tests have been introduced between xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6_full and xe-pw-133887v2_full:

### New IGT tests (10) ###

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_hdr@bpc-switch@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_hdr@static-swap@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_hdr@static-toggle@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 50.83] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-133887v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         NOTRUN -> [ABORT][19] ([Intel XE#1538] / [Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@core_hotunplug@hotreplug.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#607])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][21] ([Intel XE#1195] / [Intel XE#1330] / [Intel XE#1760])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][24] ([Intel XE#1204])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#787]) +23 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#306])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#373])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-434/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][36] -> [DMESG-WARN][37] ([Intel XE#282]) +2 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][39] ([Intel XE#1214] / [Intel XE#1608])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-dg2-set2:     [PASS][40] -> [DMESG-WARN][41] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][42] ([Intel XE#1214] / [Intel XE#282])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_feature_discovery@chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#701])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1135] / [Intel XE#1201])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#310]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#455]) +16 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [FAIL][48] ([Intel XE#1861])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#616])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#656]) +24 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_invalid_mode@int-max-clock@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][55] -> [DMESG-WARN][56] ([Intel XE#1214])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@kms_invalid_mode@int-max-clock@pipe-b-hdmi-a-1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-6/igt@kms_invalid_mode@int-max-clock@pipe-b-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][57] -> [INCOMPLETE][58] ([Intel XE#1195]) +3 other tests incomplete
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-434/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-6.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-463/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][61] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) +1 other test incomplete
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#870])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1129] / [Intel XE#1201])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf (NEW):
    - shard-dg2-set2:     [SKIP][66] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][67] ([Intel XE#929]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][70] ([Intel XE#1874]) +2 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#327])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][72] -> [FAIL][73] ([Intel XE#899])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#756])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1062] / [Intel XE#1201])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][78] -> [TIMEOUT][79] ([Intel XE#1473] / [Intel XE#392])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@xe_evict@evict-threads-large.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@xe_evict@evict-threads-large.html
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#261])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#1392]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_peer2peer@write:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1061] / [Intel XE#1201])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][86] ([Intel XE#1191] / [Intel XE#1214])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [PASS][87] -> [ABORT][88] ([Intel XE#1358])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][89] ([Intel XE#1214])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc:
    - {shard-lnl}:        [ABORT][91] -> [PASS][92] +3 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-7/igt@kms_async_flips@crc.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-4/igt@kms_async_flips@crc.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-adlp:         [ABORT][93] -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][95] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][96] +3 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][97] ([Intel XE#282]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][99] ([Intel XE#899]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][101] -> [PASS][102] +3 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-463/igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-hdmi-a-6.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-hdmi-a-6.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
    - {shard-lnl}:        [DMESG-WARN][103] ([Intel XE#1330]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-4/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-fault:
    - {shard-lnl}:        [DMESG-WARN][105] ([Intel XE#1638]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][107] ([Intel XE#1358]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_pm@s4-exec-after.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [DMESG-WARN][109] ([Intel XE#1214]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [ABORT][111] ([Intel XE#1538] / [Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760]) -> [INCOMPLETE][112] ([Intel XE#1195] / [Intel XE#1365])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         [INCOMPLETE][113] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1451]) -> [ABORT][114] ([Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][116] ([Intel XE#623])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][118] ([Intel XE#316]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#316]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][121] ([Intel XE#324]) -> [FAIL][122] ([Intel XE#1231]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][123] ([Intel XE#1231]) -> [DMESG-FAIL][124] ([Intel XE#324])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][126] ([Intel XE#607])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [ABORT][127] -> [SKIP][128] ([Intel XE#1124] / [Intel XE#1201])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1124]) -> [SKIP][130] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][132] ([Intel XE#1124]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][134] ([Intel XE#367]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#367]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1252]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#1252])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][140] ([Intel XE#1252])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#787]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][146] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][148] ([Intel XE#787]) +20 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][150] ([Intel XE#314])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1152]) -> [SKIP][152] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#306]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#306])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_chamelium_color@degamma.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][156] ([Intel XE#373]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#373]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#307]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#307])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][161] ([Intel XE#1178]) -> [INCOMPLETE][162] ([Intel XE#1195]) +1 other test incomplete
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][164] ([Intel XE#308])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#308]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [INCOMPLETE][167] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][168] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][169] ([Intel XE#1195]) -> [DMESG-WARN][170] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#323]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#323])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][173] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][174] ([Intel XE#282]) +3 other tests dmesg-warn
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][175] ([Intel XE#282]) -> [DMESG-WARN][176] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929]) -> [SKIP][178] ([Intel XE#455] / [Intel XE#929])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][179] ([i915#3804]) -> [SKIP][180] ([Intel XE#1201] / [i915#3804])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][182] ([Intel XE#701])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_feature_discovery@chamelium.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][183] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][184] ([Intel XE#1195] / [Intel XE#927])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][186] ([Intel XE#651]) +20 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#651]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][190] ([Intel XE#653]) +18 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#653]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [DMESG-WARN][193] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][194] ([Intel XE#1195] / [Intel XE#927])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][195] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][196] ([Intel XE#1195]) +1 other test incomplete
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#455]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#305]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#305]) +8 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#870]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#870])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][206] ([Intel XE#870])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_pm_backlight@fade.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1122]) -> [SKIP][208] ([Intel XE#1122] / [Intel XE#1201])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][209] ([Intel XE#1204]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#734])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#929]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][214] ([Intel XE#929]) +9 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][216] ([Intel XE#327])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1127]) -> [SKIP][218] ([Intel XE#1127] / [Intel XE#1201])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#327]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#327])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][222] ([Intel XE#1201])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@universal-plane-functional:
    - shard-dg2-set2:     [ABORT][223] -> [ABORT][224] ([Intel XE#1205])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_universal_plane@universal-plane-functional.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_universal_plane@universal-plane-functional.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][225] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][226] ([Intel XE#1162]) +1 other test dmesg-warn
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][228] ([Intel XE#455]) +8 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_vrr@flip-dpms.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#756]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#756])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][232] ([Intel XE#756]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1091]) -> [SKIP][234] ([Intel XE#1091] / [Intel XE#1201])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@sriov_basic@bind-unbind-vf.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1123]) -> [SKIP][236] ([Intel XE#1123] / [Intel XE#1201])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#288]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][240] ([Intel XE#288]) +14 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][242] ([Intel XE#255])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][244] ([Intel XE#378])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@xe_module_load@force-load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1337]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#1337])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [INCOMPLETE][247] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927]) -> [DMESG-WARN][248] ([Intel XE#1214] / [Intel XE#1608])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         [DMESG-WARN][249] ([Intel XE#1214]) -> [INCOMPLETE][250] ([Intel XE#1195])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@xe_pm@s2idle-mocs.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-1/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [DMESG-WARN][251] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][252] ([Intel XE#1195])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#366]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#366])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-adlp:         [INCOMPLETE][255] ([Intel XE#1195]) -> [DMESG-WARN][256] ([Intel XE#1214])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-adlp:         [DMESG-WARN][257] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][258] ([Intel XE#1195] / [Intel XE#1349])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#944]) -> [SKIP][260] ([Intel XE#1201] / [Intel XE#944])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@xe_query@multigpu-query-invalid-extension.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6 -> xe-pw-133887v2

  IGT_7866: 2b7701838c3ebaa3c717b6521cafafe3b9ae4a4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6: e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6
  xe-pw-133887v2: 133887v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/index.html

--===============2807376684745882786==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add process name to devcoredump (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133887/">https://patchwork.freedesktop.org/series/133887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6_full -&gt; xe-pw-133887v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133887v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133887v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133887v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-fd-no-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-2/igt@xe_exec_reset@parallel-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_exec_reset@parallel-close-fd-no-exec.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_vblank@query-idle-hang:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-6/igt@kms_vblank@query-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-4/igt@kms_vblank@query-idle-hang.html">ABORT</a> +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-8/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-6/igt@xe_evict@evict-large-multi-vm.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-6/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6_full and xe-pw-133887v2_full:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 50.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133887v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-434/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@kms_invalid_mode@int-max-clock@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-6/igt@kms_invalid_mode@int-max-clock@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-434/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-463/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf (NEW):</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_evict@evict-beng-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_evict@evict-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-7/igt@kms_async_flips@crc.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-4/igt@kms_async_flips@crc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-463/igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-hdmi-a-6.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-hdmi-a-6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-4/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-fault:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-4/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451">Intel XE#1451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_universal_plane@universal-plane-functional.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_universal_plane@universal-plane-functional.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-464/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-433/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-8/igt@xe_pm@s2idle-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-1/igt@xe_pm@s2idle-mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-8/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349">Intel XE#1349</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133887v2/shard-dg2-436/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6 -&gt; xe-pw-133887v2</li>
</ul>
<p>IGT_7866: 2b7701838c3ebaa3c717b6521cafafe3b9ae4a4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1318-e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6: e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6<br />
  xe-pw-133887v2: 133887v2</p>

</body>
</html>

--===============2807376684745882786==--
