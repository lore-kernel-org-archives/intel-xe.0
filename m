Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32882CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 15:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3E4112DE3;
	Tue,  9 Apr 2024 15:26:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A3C112DE5;
 Tue,  9 Apr 2024 15:26:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0508217685692576017=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/i915=3A_better_high_level_a?=
 =?utf-8?q?bstraction_for_display_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 15:26:48 -0000
Message-ID: <171267640840.1300822.3999920693175856776@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712665176.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712665176.git.jani.nikula@intel.com>
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

--===============0508217685692576017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: better high level abstraction for display (rev2)
URL   : https://patchwork.freedesktop.org/series/130804/
State : success

== Summary ==

CI Bug Log - changes from xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10_full -> xe-pw-130804v2_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-130804v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-adlp:         [PASS][1] -> [ABORT][2] ([Intel XE#1088])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#1201] / [Intel XE#801]) +7 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][4] ([Intel XE#1033] / [Intel XE#358]) +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_async_flips@crc.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6] ([Intel XE#1214]) +2 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#316])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][8] ([Intel XE#616]) +9 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][9] ([Intel XE#1231]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#619])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#787]) +42 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-7.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#306])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][24] -> [DMESG-WARN][25] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#308])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-adlp:         [PASS][28] -> [DMESG-WARN][29] ([Intel XE#1214])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#282])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1214] / [Intel XE#877])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-a.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#307])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][35] ([Intel XE#1195] / [Intel XE#927])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][36] ([Intel XE#1195])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [FAIL][37] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#650]) +96 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][39] -> [FAIL][40] ([Intel XE#616])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#656]) +27 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#605])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#417])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_hdr@bpc-switch.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][49] ([Intel XE#1191] / [Intel XE#1214]) +2 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][50] ([Intel XE#1214] / [i915#10142])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][51] ([Intel XE#324])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-464/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#870])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1129] / [Intel XE#1201]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@kms_psr@psr-basic.html

  * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][59] ([Intel XE#294]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#327])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         NOTRUN -> [FAIL][63] ([Intel XE#771] / [Intel XE#899])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][64] ([Intel XE#899])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1091] / [Intel XE#1201])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@sriov_basic@bind-unbind-vf.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#1447])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1126] / [Intel XE#1201])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#261]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_evict@evict-small-external.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-bal-fd-userptr:
    - shard-dg2-set2:     [PASS][74] -> [INCOMPLETE][75] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-userptr.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-rebind:
    - shard-dg2-set2:     [PASS][76] -> [TIMEOUT][77] ([Intel XE#1261] / [Intel XE#1356])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
    - shard-dg2-set2:     [PASS][78] -> [TIMEOUT][79] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#255])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#378])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#378])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_module_load@load.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][83] ([Intel XE#1043] / [Intel XE#845])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#366])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_query@multigpu-query-engines.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         NOTRUN -> [FAIL][86] ([Intel XE#1081])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][87] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][88] +8 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][89] ([Intel XE#1214]) -> [PASS][90] +2 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][91] ([Intel XE#616]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][93] ([Intel XE#771] / [Intel XE#899]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][95] ([Intel XE#899]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][97] ([Intel XE#1259] / [Intel XE#1473] / [Intel XE#402]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][99] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][101] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-dg2-set2:     [INCOMPLETE][103] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [FAIL][105] -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [ABORT][107] ([Intel XE#1538]) -> [DMESG-FAIL][108] ([Intel XE#1538])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [ABORT][109] ([Intel XE#1088]) -> [INCOMPLETE][110] ([Intel XE#1088] / [Intel XE#1195])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-436/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][111] ([Intel XE#1231]) -> [DMESG-FAIL][112] ([Intel XE#324])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][113] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][114] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][115] ([Intel XE#1214] / [i915#10142]) -> [DMESG-WARN][116] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][117] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][118] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][119] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][120] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-436/igt@kms_cursor_legacy@single-move.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-463/igt@kms_cursor_legacy@single-move.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [DMESG-WARN][121] ([Intel XE#1214] / [Intel XE#324]) -> [DMESG-FAIL][122] ([Intel XE#324])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#869]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#362])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][125] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142]) -> [DMESG-WARN][126] ([Intel XE#1191] / [Intel XE#1214])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [INCOMPLETE][127] ([Intel XE#1195]) -> [DMESG-WARN][128] ([Intel XE#1162] / [Intel XE#1214])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][129] ([Intel XE#1214] / [i915#10142]) -> [INCOMPLETE][130] ([Intel XE#1195] / [Intel XE#927])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [INCOMPLETE][131] ([Intel XE#1044] / [Intel XE#1195]) -> [DMESG-WARN][132] ([Intel XE#1191] / [Intel XE#1214])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-adlp:         [DMESG-WARN][133] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][134] ([Intel XE#1195] / [Intel XE#1349])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/869
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#10142]: https://gitlab.freedesktop.org/drm/intel/issues/10142


Build changes
-------------

  * Linux: xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10 -> xe-pw-130804v2

  IGT_7802: 7802
  xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10: d2e6568486674a4a3a4455df449d80a038f11e10
  xe-pw-130804v2: 130804v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/index.html

--===============0508217685692576017==
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
<tr><td><b>Series:</b></td><td>drm/i915: better high level abstraction for display (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130804/">https://patchwork.freedesktop.org/series/130804/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10_full -&gt; xe-pw-130804v2_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130804v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_async_flips@crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +96 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-464/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_evict@evict-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@xe_pm@s4-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-a.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-436/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-436/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-463/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/869">Intel XE#869</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-6/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v2/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349">Intel XE#1349</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10 -&gt; xe-pw-130804v2</li>
</ul>
<p>IGT_7802: 7802<br />
  xe-1060-d2e6568486674a4a3a4455df449d80a038f11e10: d2e6568486674a4a3a4455df449d80a038f11e10<br />
  xe-pw-130804v2: 130804v2</p>

</body>
</html>

--===============0508217685692576017==--
