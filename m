Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80592C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 16:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B4410FAE8;
	Wed,  8 May 2024 16:13:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCED10E9C0;
 Wed,  8 May 2024 16:13:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2301776043281516265=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Change_pcode_timeout_?=
 =?utf-8?q?to_50msec_while_polling_again_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 16:13:03 -0000
Message-ID: <171518478330.2017561.11405752048112881479@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
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

--===============2301776043281516265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Change pcode timeout to 50msec while polling again (rev2)
URL   : https://patchwork.freedesktop.org/series/133295/
State : failure

== Summary ==

CI Bug Log - changes from xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c_full -> xe-pw-133295v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133295v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133295v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133295v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-shared-vm-userptr:
    - shard-adlp:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@xe_exec_threads@threads-shared-vm-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_exec_threads@threads-shared-vm-userptr.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_fbcon_fbt@psr-suspend:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-133295v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][4] ([Intel XE#650]) +15 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201]) +16 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][8] ([Intel XE#1231]) +2 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#787]) +38 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#787]) +42 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#306])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][22] ([Intel XE#1178])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-adlp:         NOTRUN -> [FAIL][23] ([Intel XE#581])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][24] -> [DMESG-WARN][25] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#323])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][31] ([Intel XE#1162] / [Intel XE#1214]) +5 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-hdmi-a7.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][33] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1195])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [FAIL][36] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#455]) +15 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][38] ([Intel XE#324]) +1 other test dmesg-fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][40] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#656]) +24 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1151] / [Intel XE#1201]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#1214]) +1 other test dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-466/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1122] / [Intel XE#1201])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][57] ([Intel XE#616]) +3 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#327])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][60] -> [FAIL][61] ([Intel XE#899])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#756])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [i915#2575]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-adlp:         NOTRUN -> [FAIL][64] ([Intel XE#1080]) +9 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#1447])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1123] / [Intel XE#1201])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#261]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@once-userptr-invalidate:
    - shard-adlp:         [PASS][70] -> [FAIL][71] ([Intel XE#1257])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@xe_exec_basic@once-userptr-invalidate.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_exec_basic@once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#1562])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-adlp:         [PASS][75] -> [FAIL][76] ([Intel XE#1069])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1192] / [Intel XE#1201])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#366])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][79] ([Intel XE#1214] / [Intel XE#1608]) +5 other tests dmesg-warn
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][80] -> [ABORT][81] ([Intel XE#1358])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-8/igt@xe_pm@s4-basic.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][82] ([Intel XE#1195])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@xe_prime_self_import@basic-with_one_bo.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#944])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_vm@large-userptr-binds-134217728:
    - shard-dg2-set2:     [PASS][85] -> [SKIP][86] ([Intel XE#1201]) +16 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@xe_vm@large-userptr-binds-134217728.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@xe_vm@large-userptr-binds-134217728.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - {shard-lnl}:        [FAIL][87] ([Intel XE#1659]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][89] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][91] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-suspend:
    - {shard-lnl}:        [DMESG-WARN][93] -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane_cursor@viewport:
    - {shard-lnl}:        [DMESG-WARN][95] ([Intel XE#1330]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-8/igt@kms_plane_cursor@viewport.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-2/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [INCOMPLETE][97] ([Intel XE#1195]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][99] ([Intel XE#771] / [Intel XE#899]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][101] ([Intel XE#899]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][103] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-434/igt@kms_vrr@negative-basic.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - {shard-lnl}:        [DMESG-WARN][107] ([Intel XE#1620]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [DMESG-WARN][109] ([Intel XE#1214]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-1/igt@xe_pm@s4-basic-exec.html

  * {igt@xe_pm@s4-vm-bind-prefetch}:
    - {shard-lnl}:        [ABORT][111] -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [INCOMPLETE][113] ([Intel XE#1195] / [Intel XE#1451]) -> [ABORT][114] ([Intel XE#1538] / [Intel XE#1717])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@core_hotunplug@hotreplug.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [INCOMPLETE][115] ([Intel XE#1195] / [Intel XE#1365]) -> [ABORT][116] ([Intel XE#1538] / [Intel XE#1717])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][117] ([Intel XE#324]) -> [FAIL][118] ([Intel XE#1231]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [FAIL][119] ([Intel XE#650]) -> [SKIP][120] ([Intel XE#1201])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][121] ([Intel XE#1178]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#455])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][124] ([Intel XE#1178])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_content_protection@srm.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][125] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][126] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][127] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][128] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][129] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][130] ([Intel XE#1214] / [Intel XE#1608])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][131] ([Intel XE#616]) -> [DMESG-FAIL][132] ([Intel XE#1162]) +1 other test dmesg-fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][133] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][134] ([Intel XE#1214] / [Intel XE#282])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@forked-bo@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][135] ([Intel XE#1214] / [Intel XE#282]) -> [INCOMPLETE][136] ([Intel XE#1195]) +1 other test incomplete
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@pipe-b.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-466/igt@kms_cursor_legacy@forked-bo@pipe-b.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][137] ([Intel XE#1162] / [Intel XE#1214]) -> [INCOMPLETE][138] ([Intel XE#1195])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][140] ([Intel XE#1201])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][142] ([Intel XE#1201])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [INCOMPLETE][143] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][144] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-adlp:         [INCOMPLETE][145] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][146] ([Intel XE#1191] / [Intel XE#1214])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][147] ([Intel XE#1195]) -> [SKIP][148] ([Intel XE#1201] / [i915#2575])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][149] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][150] ([Intel XE#1204])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][152] ([Intel XE#1201])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_psr@fbc-psr2-basic.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][154] ([Intel XE#1201] / [i915#2575])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][155] ([Intel XE#1729]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#362])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][158] ([Intel XE#1201])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][159] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][160] ([Intel XE#1214] / [Intel XE#1608])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [DMESG-WARN][161] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][162] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@xe_pm@s2idle-basic.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-1/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][163] ([Intel XE#1214]) -> [INCOMPLETE][164] ([Intel XE#1195] / [Intel XE#1358])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [INCOMPLETE][165] ([Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][166] ([Intel XE#1214])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_prime_self_import@basic-with_two_bos:
    - shard-adlp:         [SKIP][167] ([Intel XE#1201]) -> [SKIP][168] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-9/igt@xe_prime_self_import@basic-with_two_bos.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@xe_prime_self_import@basic-with_two_bos.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1562]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1731]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1731
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c -> xe-pw-133295v2

  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c: 703bc96550be8cd9f4995bfa5126ca8a2e98c58c
  xe-pw-133295v2: 133295v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/index.html

--===============2301776043281516265==
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
<tr><td><b>Series:</b></td><td>drm/xe: Change pcode timeout to 50msec while polling again (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133295/">https://patchwork.freedesktop.org/series/133295/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c_full -&gt; xe-pw-133295v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133295v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133295v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133295v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-shared-vm-userptr:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@xe_exec_threads@threads-shared-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_exec_threads@threads-shared-vm-userptr.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_fbcon_fbt@psr-suspend:<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133295v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cursor_edge_walk@256x256-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-hdmi-a7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-466/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080">Intel XE#1080</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@xe_exec_basic@once-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_exec_basic@once-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257">Intel XE#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562">Intel XE#1562</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@xe_prime_self_import@basic-with_one_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-134217728:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@xe_vm@large-userptr-binds-134217728.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@xe_vm@large-userptr-binds-134217728.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +16 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-8/igt@kms_plane_cursor@viewport.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-2/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-434/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pm@s4-vm-bind-prefetch}:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451">Intel XE#1451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-466/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-466/igt@kms_cursor_legacy@forked-bo@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-1/igt@xe_pm@s2idle-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_two_bos:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-9/igt@xe_prime_self_import@basic-with_two_bos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133295v2/shard-adlp-4/igt@xe_prime_self_import@basic-with_two_bos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c -&gt; xe-pw-133295v2</li>
</ul>
<p>IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c: 703bc96550be8cd9f4995bfa5126ca8a2e98c58c<br />
  xe-pw-133295v2: 133295v2</p>

</body>
</html>

--===============2301776043281516265==--
