Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDE21062889
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 12:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B5910E89E;
	Wed, 11 Mar 2026 12:30:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698F810E234;
 Wed, 11 Mar 2026 12:30:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5272538375580972220=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/sysctrl=3A_Add_syst?=
 =?utf-8?q?em_controller_component_for_Xe3p_dGPU_platforms_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Mar 2026 12:30:57 -0000
Message-ID: <177323225740.345847.5447694978227530720@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
In-Reply-To: <20260310182336.611041-8-anoop.c.vijay@intel.com>
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

--===============5272538375580972220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms (rev10)
URL   : https://patchwork.freedesktop.org/series/159554/
State : failure

== Summary ==

CI Bug Log - changes from xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7_FULL -> xe-pw-159554v10_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159554v10_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159554v10_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159554v10_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@s4-basic-exec:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@xe_pm@s4-basic-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@xe_pm@s4-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-159554v10_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#6054]) +3 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2370])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][6] ([Intel XE#2705]) +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652]) +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#3432])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +9 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2724] / [Intel XE#7449])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325] / [Intel XE#7358])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252]) +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7194])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +4 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2291]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2286] / [Intel XE#6035])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1508])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2244]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2244]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6126] / [Intel XE#776])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2373] / [Intel XE#7344])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-7/igt@kms_feature_discovery@display-2x.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2316]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2316]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1397] / [Intel XE#7385])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7179])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2311]) +23 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2312]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#656]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4141]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2313]) +20 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6911] / [Intel XE#7466])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#6900] / [Intel XE#7362])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6911] / [Intel XE#7378])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6912] / [Intel XE#7375])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7283]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2393])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#5020] / [Intel XE#7348])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2763] / [Intel XE#6886]) +14 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#3309] / [Intel XE#7368])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#2029] / [Intel XE#7395])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1489]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1406] / [Intel XE#2414])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2413]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#1435])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [FAIL][64] ([Intel XE#1729] / [Intel XE#7424])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2426] / [Intel XE#5848])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1499])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2168] / [Intel XE#7444])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#4837]) +7 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#6665])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][72] -> [INCOMPLETE][73] ([Intel XE#6321])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#7140])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@xe_evict@evict-mixed-threads-small-multi-queue.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#7482])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7136]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7136]) +13 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#6874]) +20 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#6874])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7138]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2229])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108]) -> ([PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [SKIP][131], [PASS][132], [PASS][133], [PASS][134]) ([Intel XE#2457] / [Intel XE#7405])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-1/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-10/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-2/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-1/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-4/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-4/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-10/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-10/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-9/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-9/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-7/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-2/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-6/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-7/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-6/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-6/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-2/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#6964]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#6964])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-6/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2245])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2284] / [Intel XE#7370])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#584] / [Intel XE#7369])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#4733] / [Intel XE#7417]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][141] -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][143] ([Intel XE#2291]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][145] ([Intel XE#7571]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][147] ([Intel XE#2316]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][149] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][151] ([Intel XE#5625]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [ABORT][153] -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][155] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][156] ([Intel XE#2341])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][157] ([Intel XE#2341]) -> [FAIL][158] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_content_protection@legacy.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-bmg:          [FAIL][159] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][160] ([Intel XE#7194])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@kms_content_protection@lic-type-0-hdcp14.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][161] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][162] ([Intel XE#7194])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][163] ([Intel XE#2312]) -> [SKIP][164] ([Intel XE#2311]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][165] ([Intel XE#4141]) -> [SKIP][166] ([Intel XE#2312]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][167] ([Intel XE#2312]) -> [SKIP][168] ([Intel XE#4141]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][169] ([Intel XE#2311]) -> [SKIP][170] ([Intel XE#2312]) +13 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][171] ([Intel XE#2313]) -> [SKIP][172] ([Intel XE#2312]) +11 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#2313]) +6 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][175] ([Intel XE#3544]) -> [SKIP][176] ([Intel XE#3374] / [Intel XE#3544])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776


Build changes
-------------

  * IGT: IGT_8791 -> IGT_8792
  * Linux: xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7 -> xe-pw-159554v10

  IGT_8791: b319fd1815d426b3f24094113d614d08dee374d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8792: 8792
  xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7: bf3ba6a508ffb59323357535a459eb64f02d94f7
  xe-pw-159554v10: 159554v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/index.html

--===============5272538375580972220==
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
<tr><td><b>Series:</b></td><td>drm/xe/sysctrl: Add system controller compon=
ent for Xe3p dGPU platforms (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159554/">https://patchwork.freedesktop.org/series/159554/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159554v10/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159554v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4691-bf3ba6a508ffb59323357535a459eb64f=
02d94f7_FULL -&gt; xe-pw-159554v10_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159554v10_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159554v10_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1595=
54v10_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@s4-basic-exec:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@xe_pm@s4=
-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@xe_pm@s4-basic-exec.html">INCOMP=
LETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159554v10_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-lnl-4/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9554v10/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-li=
near-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) +3 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@kms_atomic_transition@plane-=
all-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-2/igt@kms_atomic_transition@plane-=
all-modeset-transition@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@kms_big_fb@linear-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/i=
gt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#=
2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
894">Intel XE#2894</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7373">Intel XE#7373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_bw@connected-linear-tili=
ng-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#737=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-ti=
led-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-1/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_cdclk@mode-transition.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_chamelium_color@ctm-0-75=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd=
-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_content_protection@atomi=
c-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 oth=
er test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_content_protection@atomi=
c-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7194">Intel XE#7194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)=
 +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@kms_cursor_crc@cursor-onscre=
en-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2320">Intel XE#2320</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/s=
hard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varyin=
g-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035"=
>Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioc=
tl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@kms_dsc@dsc-with-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6126">Intel XE#6126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-7/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_feature_discove=
ry@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2373">Intel XE#2373</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblan=
k-race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-6/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/=
shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#73=
51</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385"=
>Intel XE#7385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
385">Intel XE#7385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_flip_scaled_crc@flip-nv1=
2-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-2/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +23 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-8/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drr=
s-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8=
888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_plane@pixel-format-4-til=
ed-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@kms_plane_multiple@tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-lnl-3/igt@kms_pm_d=
c@deep-pkgc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-159554v10/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">In=
tel XE#2029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@kms_psr2_sf@pr-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_psr@psr2-sprite-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-2/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_scaling_modes@scaling-mo=
de-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-9/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_setmode@in=
valid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_create@multigpu-create-ma=
ssive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2504">Intel XE#2504</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_eudebug@vm-bind-clear.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_eudebug_online@pagefault-=
one-of-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_eudebug_online@set-breakp=
oint-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-6/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_evict@evi=
ct-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@xe_evict@evict-mixed-threads=
-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@xe_exec_balancer@twice-virtu=
al-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_exec_basic@multigpu-no-ex=
ec-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@xe_exec_fault_mode@many-exec=
queues-multi-queue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/igt@xe_exec_fault_mode@twice-mul=
ti-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7136">Intel XE#7136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_exec_multi_queue@many-exe=
cs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +20 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-2/igt@xe_exec_multi_queue@one-queu=
e-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_exec_threads@threads-mult=
i-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_ccs_m=
igrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_media_fill@media-fill.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2596">Intel XE#2596</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-1=
0/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f=
7/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02=
d94f7/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb6=
4f02d94f7/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a45=
9eb64f02d94f7/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357=
535a459eb64f02d94f7/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb593=
23357535a459eb64f02d94f7/shard-bmg-10/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508f=
fb59323357535a459eb64f02d94f7/shard-bmg-9/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a=
508ffb59323357535a459eb64f02d94f7/shard-bmg-9/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3=
ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4691=
-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-2/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-6/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg=
-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/s=
hard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94=
f7/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-159554v10/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554=
v10/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bm=
g-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59554v10/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-159554v10/shard-bmg-3/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-159554v10/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15955=
4v10/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_module_load@load.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159554v10/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Inte=
l XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/igt@xe_multigpu_svm@mgpu-coheren=
cy-fail-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-6/igt@xe_multigpu_svm@mgpu-latency=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@xe_pat@pat-index-xelp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
45">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-lnl-5/igt@xe_pm@s3-multiple-execs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159554v10/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7417">Intel XE#7417</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_atom=
ic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v1=
0/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pip=
e-a-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/=
igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-5/i=
gt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_flip=
@2x-blocking-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-10/igt@kms_fl=
ip@2x-blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/sha=
rd-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-lnl-2/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE=
#5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-159554v10/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_run.html">ABORT</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-6/i=
gt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7=
374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59554v10/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel=
 XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-4/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@kms_cont=
ent_protection@lic-type-0-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Inte=
l XE#7374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-159554v10/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7194">Intel XE#7194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@kms_cont=
ent_protection@uevent-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/sha=
rd-bmg-5/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194">Intel XE#7194=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159554v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shr=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1595=
54v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1595=
54v10/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9554v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1595=
54v10/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159554v10/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7/shard-bmg-9/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v10/shard-bmg-8/igt@kms_hdr@br=
ightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8791 -&gt; IGT_8792</li>
<li>Linux: xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7 -&gt; xe-pw-159=
554v10</li>
</ul>
<p>IGT_8791: b319fd1815d426b3f24094113d614d08dee374d8 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8792: 8792<br />
  xe-4691-bf3ba6a508ffb59323357535a459eb64f02d94f7: bf3ba6a508ffb5932335753=
5a459eb64f02d94f7<br />
  xe-pw-159554v10: 159554v10</p>

</body>
</html>

--===============5272538375580972220==--
