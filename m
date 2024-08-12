Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B19C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 18:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3AD10E266;
	Mon, 12 Aug 2024 18:09:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C15810E266;
 Mon, 12 Aug 2024 18:09:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2702073261492020647=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/xe2hpg=3A_Add_wa=5F14021?=
 =?utf-8?q?821874_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 18:09:15 -0000
Message-ID: <172348615543.595846.7763782269814746051@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812134117.813670-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240812134117.813670-1-tejas.upadhyay@intel.com>
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

--===============2702073261492020647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2hpg: Add wa_14021821874 (rev3)
URL   : https://patchwork.freedesktop.org/series/133007/
State : failure

== Summary ==

CI Bug Log - changes from xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be_full -> xe-pw-133007v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133007v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133007v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133007v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-bal-userptr-invalidate-race:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html

  * igt@xe_pm@s3-mocs:
    - shard-adlp:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-8/igt@xe_pm@s3-mocs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_pm@s3-mocs.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [FAIL][5] ([Intel XE#2028]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#1201]) -> [SKIP][8] +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@bd-dp2-hdmi-a3:
    - {shard-bmg}:        [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bd-dp2-hdmi-a3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:
    - {shard-bmg}:        [PASS][11] -> [DMESG-WARN][12] +2 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-8/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-6/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-133007v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1399])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#306])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#599])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#309])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1421])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#1901] / [Intel XE#2028]) +2 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1397] / [Intel XE#1745])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1397])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][30] -> [FAIL][31] ([Intel XE#1874]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#651])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#656]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#651]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#651])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#656]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#2028]) +3 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1158] / [Intel XE#1201])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#653]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:
    - shard-lnl:          [PASS][42] -> [DMESG-WARN][43] ([Intel XE#324]) +1 other test dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2318]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c-edp-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#870])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][46] -> [FAIL][47] ([Intel XE#718])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1705]) +1 other test dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#929])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#327])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][53] -> [FAIL][54] ([Intel XE#771] / [Intel XE#899])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#899]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][57] -> [FAIL][58] ([Intel XE#899])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_writeback@writeback-check-output:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#756])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_writeback@writeback-check-output.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1126] / [Intel XE#1201])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#261])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][62] -> [TIMEOUT][63] ([Intel XE#1473] / [Intel XE#402])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#688])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1392]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#2360])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][69] -> [TIMEOUT][70] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-9/igt@xe_module_load@many-reload.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-4/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][71] -> [ABORT][72] ([Intel XE#1358] / [Intel XE#1794])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][73] -> [ABORT][74] ([Intel XE#1794])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-4/igt@xe_pm@s4-mocs.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][75] -> [ABORT][76] ([Intel XE#1358] / [Intel XE#1794])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [FAIL][77] ([Intel XE#827]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][79] ([Intel XE#1033]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][81] ([Intel XE#1701]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][83] ([Intel XE#1426]) -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][85] ([Intel XE#1659]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [FAIL][87] ([Intel XE#2436]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][89] -> [PASS][90] +2 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][91] ([Intel XE#877]) -> [PASS][92] +5 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-lnl:          [FAIL][93] ([Intel XE#2028]) -> [PASS][94] +4 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-WARN][95] ([Intel XE#324]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@kms_plane@plane-position-covered.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][97] ([Intel XE#1874]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][99] ([Intel XE#361]) -> [PASS][100] +2 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][101] ([Intel XE#1600]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][103] ([Intel XE#1473]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][105] ([Intel XE#1473]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_basic@many-basic-defer-mmap:
    - shard-lnl:          [FAIL][107] -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-6/igt@xe_exec_basic@many-basic-defer-mmap.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-4/igt@xe_exec_basic@many-basic-defer-mmap.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][109] ([Intel XE#1358]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][111] ([Intel XE#1794]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][113] ([Intel XE#958]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#316]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#316])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][118] ([Intel XE#316]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][119] ([Intel XE#324]) -> [FAIL][120] ([Intel XE#1231])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][121] ([Intel XE#1231]) -> [DMESG-FAIL][122] ([Intel XE#324])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#610]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#610])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1124]) -> [SKIP][126] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][128] ([Intel XE#1124]) +11 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][130] ([Intel XE#346])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_big_joiner@basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#346]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#346])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][134] ([Intel XE#367]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][136] ([Intel XE#2191]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#2191]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#2191])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#367]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][142] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][146] ([Intel XE#787]) +97 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#787]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][150] ([Intel XE#306]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#306]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#306])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#373]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][156] ([Intel XE#373]) +9 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][158] ([Intel XE#307]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][160] ([Intel XE#308])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#308]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#308])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][164] ([Intel XE#323])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#323]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][167] ([i915#3804]) -> [SKIP][168] ([Intel XE#1201] / [i915#3804])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][170] ([Intel XE#455]) +7 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#651]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#651]) +23 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][174] ([Intel XE#658])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][176] ([Intel XE#651]) +26 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#653]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][180] ([Intel XE#653]) +25 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][182] ([Intel XE#605])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#356]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#356])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#498]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2318]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][194] ([Intel XE#2318]) +5 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][196] ([Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#870]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#870])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1129]) -> [SKIP][200] ([Intel XE#1129] / [Intel XE#1201])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][202] ([Intel XE#1489]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1489]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][206] ([Intel XE#929]) +15 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#929]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][210] ([Intel XE#327]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1127]) -> [SKIP][212] ([Intel XE#1127] / [Intel XE#1201])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#327]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#327])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#362])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][218] ([Intel XE#330])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][220] ([Intel XE#2168])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_vrr@cmrr.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#455]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_vrr@flip-dpms.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#756]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][226] ([Intel XE#756])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][228] ([Intel XE#1091])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][232] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1123]) -> [SKIP][234] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][235] ([Intel XE#1473]) -> [INCOMPLETE][236] ([Intel XE#1195] / [Intel XE#1473])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#288]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#288]) +19 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][240] ([Intel XE#288]) +22 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][242] ([Intel XE#2360])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#255]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#255])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#378]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#378])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     [SKIP][247] -> [SKIP][248] ([Intel XE#1201]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_oa@rc6-disable.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#977]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#977])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][252] ([Intel XE#2284] / [Intel XE#366])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#579]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#579])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][256] ([Intel XE#944]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#944]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#944])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be -> xe-pw-133007v3

  IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be: b6531fdf51e4068bc53c995b6db105d28ade44be
  xe-pw-133007v3: 133007v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/index.html

--===============2702073261492020647==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2hpg: Add wa_14021821874 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133007/">https://patchwork.freedesktop.org/series/133007/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be_full -&gt; xe-pw-133007v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133007v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133007v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133007v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-8/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_pm@s3-mocs.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bd-dp2-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-8/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-6/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133007v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-9/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-4/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353">Intel XE#1353</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-4/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-1/igt@kms_plane@plane-position-covered.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-6/igt@xe_exec_basic@many-basic-defer-mmap.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-4/igt@xe_exec_basic@many-basic-defer-mmap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_oa@rc6-disable.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133007v3/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be -&gt; xe-pw-133007v3</li>
</ul>
<p>IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1752-b6531fdf51e4068bc53c995b6db105d28ade44be: b6531fdf51e4068bc53c995b6db105d28ade44be<br />
  xe-pw-133007v3: 133007v3</p>

</body>
</html>

--===============2702073261492020647==--
