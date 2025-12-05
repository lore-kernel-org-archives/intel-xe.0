Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DADD2CE1A
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 05:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE2510EA07;
	Fri,  5 Dec 2025 05:08:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF12710EA07;
 Fri,  5 Dec 2025 05:08:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4341700581876395838=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_Use_DRM=5FBUDDY?=
 =?utf-8?q?=5FCONTIGUOUS=5FALLOCATION_for_contiguous_allocations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Dec 2025 05:08:29 -0000
Message-ID: <176491130990.59950.6501524537488003173@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251205031112.3590252-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20251205031112.3590252-2-sanjay.kumar.yadav@intel.com>
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

--===============4341700581876395838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations
URL   : https://patchwork.freedesktop.org/series/158526/
State : success

== Summary ==

CI Bug Log - changes from xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d_FULL -> xe-pw-158526v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d_FULL and xe-pw-158526v1_FULL:

### New IGT tests (37) ###

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@crc-atomic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.96] s

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_async_flips@crc-atomic@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.97] s

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@crc-atomic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.92] s

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_async_flips@test-time-stamp-atomic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-123:
    - Statuses : 4 pass(s)
    - Exec time: [2.61, 12.85] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-133:
    - Statuses : 4 pass(s)
    - Exec time: [2.69, 12.85] s

  * igt@kms_pm_rpm@legacy-planes@plane-123:
    - Statuses : 3 pass(s)
    - Exec time: [2.66, 12.73] s

  * igt@kms_pm_rpm@legacy-planes@plane-133:
    - Statuses : 3 pass(s)
    - Exec time: [2.69, 12.84] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-123:
    - Statuses : 4 pass(s)
    - Exec time: [2.58, 12.03] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-133:
    - Statuses : 4 pass(s)
    - Exec time: [2.60, 12.03] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-143:
    - Statuses : 4 pass(s)
    - Exec time: [2.47, 12.01] s

  * igt@kms_pm_rpm@universal-planes@plane-123:
    - Statuses : 4 pass(s)
    - Exec time: [2.60, 12.13] s

  * igt@kms_pm_rpm@universal-planes@plane-133:
    - Statuses : 4 pass(s)
    - Exec time: [2.48, 12.73] s

  * igt@kms_pm_rpm@universal-planes@plane-143:
    - Statuses : 4 pass(s)
    - Exec time: [2.58, 12.11] s

  

Known issues
------------

  Here are the changes found in xe-pw-158526v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         NOTRUN -> [ABORT][1] ([Intel XE#6675]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][2] ([Intel XE#1124]) +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#316])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#367])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#787]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#787]) +14 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#4418])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#373]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#306])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#373]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#6704]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf.html

  * igt@kms_colorop@plane-xr30-xr30-multiply_inv_125:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#6704])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_colorop@plane-xr30-xr30-multiply_inv_125.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][17] ([Intel XE#1178]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][18] ([Intel XE#6707]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#309]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-adlp:         NOTRUN -> [CRASH][20] ([Intel XE#6706]) +1 other test crash
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1135])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#310])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2:
    - shard-bmg:          [PASS][23] -> [FAIL][24] ([Intel XE#5416] / [Intel XE#6266]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455]) +12 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#6312]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#651]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#651]) +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [FAIL][29] ([Intel XE#5671])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4141])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#656]) +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#653]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#653]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2313])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#2925]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          [PASS][36] -> [ABORT][37] ([Intel XE#6675]) +2 other tests abort
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-lnl:          NOTRUN -> [ABORT][38] ([Intel XE#6675])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#5020])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#870])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1122])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1122] / [Intel XE#1406] / [Intel XE#5580])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#3414]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#330])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_copy_basic@mem-page-copy-1:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#5300])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_copy_basic@mem-page-copy-1.html

  * igt@xe_copy_basic@mem-page-copy-17:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#5300])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_copy_basic@mem-page-copy-17.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#4837])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-access-parameters-faultable:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#4837] / [Intel XE#5565]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_eudebug@basic-vm-access-parameters-faultable.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#4837] / [Intel XE#5565] / [Intel XE#6665]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#261]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][57] -> [INCOMPLETE][58] ([Intel XE#6321])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_evict@evict-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#688])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1392] / [Intel XE#5575]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#288] / [Intel XE#5561]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#288]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4943])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#4915]) +115 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#4915]) +70 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#3573])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#3573]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@tail-address-wrap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#6032])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_oa@tail-address-wrap.html

  * igt@xe_peer2peer@write:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1061])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     NOTRUN -> [ABORT][71] ([Intel XE#6675]) +2 other tests abort
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][72] -> [ABORT][73] ([Intel XE#6675]) +3 other tests abort
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-adlp-3/igt@xe_pm@s4-basic-exec.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#4733] / [Intel XE#5594])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#944])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#944])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#4814])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_render_copy@render-stress-2-copies.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          [SKIP][78] ([Intel XE#367]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-lnl:          [ABORT][80] ([Intel XE#6675]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [SKIP][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107]) ([Intel XE#378]) -> ([PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-5/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-4/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-5/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-4/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-5/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-5/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-2/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-1/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-8/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-3/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-4/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-2/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-1/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-1/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-5/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-2/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-8/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-8/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-8/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-4/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-4/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-1/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-1/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-3/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-2/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-2/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-5/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-5/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-5/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-5/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-4/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-1/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-4/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-8/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-8/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-8/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-8/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-3/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-4/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-1/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-1/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-2/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-3/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-3/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-1/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-basic:
    - shard-bmg:          [ABORT][133] ([Intel XE#6675]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-bmg-1/igt@xe_pm@s2idle-basic.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [ABORT][135] ([Intel XE#6675]) -> [PASS][136] +2 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-adlp-4/igt@xe_pm@s3-d3hot-basic-exec.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5671
  [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
  [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
  [Intel XE#6706]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6775
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d -> xe-pw-158526v1

  IGT_8655: 8655
  xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d: b91a982bdeb8b2c13917d3726c86cfa57ff3202d
  xe-pw-158526v1: 158526v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/index.html

--===============4341700581876395838==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION =
for contiguous allocations</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158526/">https://patchwork.freedesktop.org/series/158526/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-158526v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-158526v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4195-b91a982bdeb8b2c13917d3726c86cfa57=
ff3202d_FULL -&gt; xe-pw-158526v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4195-b91a982bdeb8b2c13917d3726=
c86cfa57ff3202d_FULL and xe-pw-158526v1_FULL:</p>
<h3>New IGT tests (37)</h3>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-123:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.61, 12.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-133:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.69, 12.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-123:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.66, 12.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-133:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.69, 12.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-123:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.58, 12.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-133:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.60, 12.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-143:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.47, 12.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-123:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.60, 12.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-133:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.48, 12.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-143:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.58, 12.11] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158526v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_async_flips@async-flip-s=
uspend-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6675">Intel XE#6675</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-1-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#36=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_ccs@ccs-on-another-bo-4-=
tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audi=
o-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_chamelium_color@ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_chamelium_frames@hdmi-cr=
c-planes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_colorop@plane-xr24-xr24-=
srgb_eotf-srgb_inv_eotf-srgb_eotf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6704">Intel XE#6704</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-multiply_inv_125:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_colorop@plane-xr30-xr30=
-multiply_inv_125.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6704">Intel XE#6704</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-463/igt@kms_content_protection@atom=
ic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6707">Intel XE#6707</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs=
-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_fb_coherency@memset-crc.=
html">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6706">Intel XE#6706</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_feature_discovery@psr2.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-absolute=
-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-bmg-1/igt@kms_flip=
@plain-flip-ts-check-interruptible@a-dp2.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@kms_=
flip@plain-flip-ts-check-interruptible@a-dp2.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5416">Intel XE#5416</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel =
XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32b=
pp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
-1p-offscreen-pri-shrfb-draw-render.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5671">Intel XE#5671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_joiner@switch-modeset-ul=
tra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-2/igt@kms_pipe=
_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-2/igt@kms_=
pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) =
+2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-lnl-1/igt@kms_plane@plane-panning-botto=
m-right-suspend@pipe-b.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_pm_backlight@fade-with-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5580">Intel XE#5580</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plan=
e-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_psr@pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@kms_scaling_modes@scaling-m=
ode-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-8/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-page-copy-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_copy_basic@mem-page-copy-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5300">Intel XE#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-page-copy-17:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_copy_basic@mem-page-copy=
-17.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5300">Intel XE#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_eudebug@basic-vm-access-=
parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-faultable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_eudebug@basic-vm-access-p=
arameters-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_eudebug_online@breakpoint=
-many-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_eudebug_online@writes-ca=
ching-vram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_evict@evict-beng-cm-threa=
ds-small-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-bmg-2/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_evict@evict-small.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/261=
">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_exec_fault_mode@once-inv=
alid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@xe_exec_system_allocator@once=
-large-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_exec_system_allocator@onc=
e-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +115 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunma=
p-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_exec_system_allocator@th=
reads-many-execqueues-mmap-remap-dontunmap-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_oa@invalid-oa-metric-set=
-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_oa@privileged-forked-acce=
ss-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@tail-address-wrap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_oa@tail-address-wrap.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6032">Intel XE#6032</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_peer2peer@write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"=
>Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_pm@s2idle-exec-after.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6675">Intel XE#6675</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-adlp-3/igt@xe_pm@s=
4-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-158526v1/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">=
Intel XE#6675</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-adlp-6/igt@xe_query@multigpu-query-cs-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_query@multigpu-query-gt-=
list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-158526v1/shard-dg2-432/igt@xe_render_copy@render-stres=
s-2-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shar=
d-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-1/igt@kms_plan=
e@plane-panning-bottom-right-suspend@pipe-a.html">ABORT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6675">Intel XE#6675</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/sh=
ard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-l=
nl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/sha=
rd-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3=
202d/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa5=
7ff3202d/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86=
cfa57ff3202d/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d372=
6c86cfa57ff3202d/shard-lnl-4/igt@xe_module_load@load.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917=
d3726c86cfa57ff3202d/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c1=
3917d3726c86cfa57ff3202d/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8=
b2c13917d3726c86cfa57ff3202d/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982b=
deb8b2c13917d3726c86cfa57ff3202d/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-b91a=
982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4195-=
b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-=
lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202=
d/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
526v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-158526v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
526v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-158526v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
526v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-158526v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
526v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-158526v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158=
526v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-158526v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-bmg-1/igt@xe_pm@s2=
idle-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6675">Intel XE#6675</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-bmg-1/igt@xe_pm@s2idle-basic.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d/shard-adlp-4/igt@xe_pm@s=
3-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6675">Intel XE#6675</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-158526v1/shard-adlp-8/igt@xe_pm@s3-d=
3hot-basic-exec.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d -&gt; xe-pw-158=
526v1</li>
</ul>
<p>IGT_8655: 8655<br />
  xe-4195-b91a982bdeb8b2c13917d3726c86cfa57ff3202d: b91a982bdeb8b2c13917d37=
26c86cfa57ff3202d<br />
  xe-pw-158526v1: 158526v1</p>

</body>
</html>

--===============4341700581876395838==--
