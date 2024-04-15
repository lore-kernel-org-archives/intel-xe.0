Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA58DC00A94
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 21:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF8811280E;
	Mon, 15 Apr 2024 21:39:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BC810E9D4;
 Mon, 15 Apr 2024 21:39:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2500558827110042443=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Cleanup_and_fixes_in_drmm=5Fadd?=
 =?utf-8?q?=5Faction=5For=5Freset_usage_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 21:39:08 -0000
Message-ID: <171321714867.1424052.8963948473963357172@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
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

--===============2500558827110042443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleanup and fixes in drmm_add_action_or_reset usage (rev4)
URL   : https://patchwork.freedesktop.org/series/132150/
State : failure

== Summary ==

CI Bug Log - changes from xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5_full -> xe-pw-132150v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132150v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132150v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132150v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][1] -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind:
    - shard-adlp:         [DMESG-WARN][3] ([Intel XE#1214] / [Intel XE#1352]) -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-9/igt@core_hotunplug@hotrebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [DMESG-WARN][5] ([Intel XE#1214] / [Intel XE#1352]) -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-2/igt@core_hotunplug@hotrebind-lateclose.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@core_hotunplug@hotrebind-lateclose.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@hotrebind:
    - {shard-lnl}:        [DMESG-WARN][7] ([Intel XE#1603]) -> [DMESG-FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@core_hotunplug@hotrebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - {shard-lnl}:        NOTRUN -> [DMESG-FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - {shard-lnl}:        NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:
    - {shard-lnl}:        [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-132150v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#660])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#316])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +78 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#650]) +12 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#306])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#306])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][29] ([Intel XE#1178]) +2 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][33] ([Intel XE#1214] / [Intel XE#282])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#309])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#323])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][36] ([Intel XE#1214]) +9 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][38] -> [DMESG-WARN][39] ([Intel XE#1214]) +2 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][41] -> [FAIL][42] ([Intel XE#616]) +3 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#656]) +13 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1158] / [Intel XE#1201])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#616]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][50] ([Intel XE#1214] / [Intel XE#324])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#1203])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#1201] / [Intel XE#1211])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [PASS][62] -> [FAIL][63] ([Intel XE#1174])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@kms_sysfs_edid_timing.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@max-min:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_vrr@max-min.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1091] / [Intel XE#1201])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#261])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][67] ([Intel XE#1473] / [Intel XE#392])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-dg2-set2:     [PASS][68] -> [FAIL][69] ([Intel XE#1259])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-small.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][70] -> [TIMEOUT][71] ([Intel XE#1473] / [Intel XE#392])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][72] -> [INCOMPLETE][73] ([Intel XE#1195] / [Intel XE#1473])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][74] ([Intel XE#1473])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][78] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1206] / [Intel XE#1356])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@xe_exec_threads@threads-mixed-fd-userptr-rebind.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-userptr-rebind.html

  * igt@xe_pm@d3-mmap-system:
    - shard-adlp:         NOTRUN -> [FAIL][81] ([Intel XE#1221])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][82] -> [FAIL][83] ([Intel XE#355])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-436/igt@xe_pm@d3hot-basic-exec.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#366])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#944])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - {shard-lnl}:        [DMESG-FAIL][86] ([Intel XE#1602]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - {shard-lnl}:        [DMESG-FAIL][88] ([Intel XE#1602] / [Intel XE#1619]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201] / [i915#2575]) -> [PASS][91] +13 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_color@ctm-0-75.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_color@ctm-0-75.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2-set2:     [DMESG-WARN][92] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][93] +3 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - {shard-lnl}:        [FAIL][94] ([Intel XE#480]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][96] ([Intel XE#1214]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-464/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - {shard-lnl}:        [FAIL][98] ([Intel XE#1491]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear:
    - {shard-lnl}:        [FAIL][100] -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][102] ([Intel XE#616]) -> [PASS][103] +3 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - {shard-lnl}:        [INCOMPLETE][104] ([Intel XE#1602]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - {shard-lnl}:        [DMESG-FAIL][106] ([Intel XE#1537] / [Intel XE#1602]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - {shard-lnl}:        [DMESG-WARN][108] -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-464/igt@kms_pm_rpm@cursor.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-435/igt@kms_pm_rpm@cursor.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - {shard-lnl}:        [FAIL][112] ([Intel XE#1605]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201]) -> [PASS][115] +45 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][117] +2 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-4.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-4.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][118] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-dg2-set2:     [FAIL][120] ([Intel XE#1259]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - {shard-lnl}:        [ABORT][122] -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@once-preempt-fence-early:
    - {shard-lnl}:        [DMESG-WARN][124] ([Intel XE#1537]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-7/igt@xe_exec_compute_mode@once-preempt-fence-early.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-7/igt@xe_exec_compute_mode@once-preempt-fence-early.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - {shard-lnl}:        [DMESG-WARN][126] ([Intel XE#1602]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@xe_exec_reset@close-execqueues-close-fd.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@xe_exec_reset@close-execqueues-close-fd.html

  * igt@xe_exec_threads@threads-hang-basic:
    - {shard-lnl}:        [FAIL][128] ([Intel XE#1256]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-3/igt@xe_exec_threads@threads-hang-basic.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-1/igt@xe_exec_threads@threads-hang-basic.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [TIMEOUT][130] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - {shard-lnl}:        [FAIL][132] ([Intel XE#1081]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_vm@large-userptr-binds-16777216:
    - {shard-lnl}:        [DMESG-FAIL][134] ([Intel XE#1619]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - {shard-lnl}:        [FAIL][136] ([Intel XE#1440]) -> [PASS][137] +2 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-3/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-1/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [i915#2575]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#455])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#316])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][142] ([Intel XE#1231]) -> [DMESG-FAIL][143] ([Intel XE#324])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][144] ([Intel XE#324]) -> [FAIL][145] ([Intel XE#1231])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201]) -> [SKIP][147] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [i915#2575]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#367])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [i915#2575]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_chamelium_color@gamma.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [i915#2575]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#373])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [i915#2575]) -> [FAIL][157] ([Intel XE#1178])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_content_protection@atomic.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][158] ([Intel XE#1204]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#455])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][160] ([Intel XE#1188]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#455])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_content_protection@uevent.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [i915#2575]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#308])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-FAIL][164] ([Intel XE#1162]) -> [FAIL][165] ([Intel XE#616]) +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][167] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [i915#2575]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#307])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][170] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][171] ([Intel XE#1191] / [Intel XE#1214])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][172] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][173] ([Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][176] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][177] ([Intel XE#1195] / [Intel XE#927])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [i915#2575]) -> [FAIL][183] ([Intel XE#616])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_hdr@static-toggle-suspend.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [DMESG-FAIL][184] ([Intel XE#324]) -> [DMESG-WARN][185] ([Intel XE#1214] / [Intel XE#324])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201]) -> [SKIP][189] ([Intel XE#1149] / [Intel XE#1201])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [i915#2575]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#327])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#869])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [i915#2575]) -> [SKIP][195] ([Intel XE#1091] / [Intel XE#1201])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201]) -> [FAIL][197] ([Intel XE#1259])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#366])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_pm@d3cold-basic.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [INCOMPLETE][202] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927]) -> [DMESG-WARN][203] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][204] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][205] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-WARN][206] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][207] ([Intel XE#1195] / [Intel XE#1358])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-6/igt@xe_pm@s3-basic.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-9/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201]) -> [DMESG-FAIL][209] ([Intel XE#1162] / [Intel XE#1551])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_pm@s4-basic.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [FAIL][210] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][211] ([Intel XE#1162])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@xe_pm@s4-basic-exec.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201]) -> [FAIL][213] ([Intel XE#1043] / [Intel XE#845])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_pm@s4-multiple-execs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1352
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1415
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1605
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
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
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/869
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575


Build changes
-------------

  * Linux: xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5 -> xe-pw-132150v4

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5: a503d0d68ea39792b2740a7af033bd42fb84f4a5
  xe-pw-132150v4: 132150v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/index.html

--===============2500558827110042443==
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
<tr><td><b>Series:</b></td><td>Cleanup and fixes in drmm_add_action_or_reset usage (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132150/">https://patchwork.freedesktop.org/series/132150/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5_full -&gt; xe-pw-132150v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132150v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132150v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132150v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@s3-d3hot-basic-exec:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html">WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-9/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1352">Intel XE#1352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@core_hotunplug@hotrebind.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-2/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1352">Intel XE#1352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@core_hotunplug@hotrebind-lateclose.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603">Intel XE#1603</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@core_hotunplug@hotrebind.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132150v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@xe_evict@evict-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@xe_exec_threads@threads-mixed-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-userptr-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_pm@d3-mmap-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-436/igt@xe_pm@d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_color@ctm-0-75.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-464/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-464/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-435/igt@kms_pm_rpm@cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1605">Intel XE#1605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6.html">PASS</a> +45 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-preempt-fence-early:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-7/igt@xe_exec_compute_mode@once-preempt-fence-early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-7/igt@xe_exec_compute_mode@once-preempt-fence-early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@xe_exec_reset@close-execqueues-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-3/igt@xe_exec_threads@threads-hang-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-1/igt@xe_exec_threads@threads-hang-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-16777216:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-lnl-3/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440">Intel XE#1440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-lnl-1/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_hdr@static-toggle-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_plane_lowres@tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/869">Intel XE#869</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-adlp-6/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-adlp-9/igt@xe_pm@s3-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_pm@s4-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_pm@s4-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-435/igt@xe_pm@s4-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-464/igt@xe_pm@s4-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132150v4/shard-dg2-436/igt@xe_pm@s4-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5 -&gt; xe-pw-132150v4</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1086-a503d0d68ea39792b2740a7af033bd42fb84f4a5: a503d0d68ea39792b2740a7af033bd42fb84f4a5<br />
  xe-pw-132150v4: 132150v4</p>

</body>
</html>

--===============2500558827110042443==--
