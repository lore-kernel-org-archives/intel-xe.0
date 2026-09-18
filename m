Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10B6C982D7
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 23:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0E810E0F5;
	Fri, 18 Sep 2026 23:14:56 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FC610E0F5;
 Fri, 18 Sep 2026 23:14:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1567665484308364769=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Crescent_Island_PMT_suppor?=
 =?utf-8?q?t_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 23:14:55 -0000
Message-ID: <178977329534.183552.616709300611301192@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
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

--===============1567665484308364769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crescent Island PMT support (rev12)
URL   : https://patchwork.freedesktop.org/series/160717/
State : failure

== Summary ==

CI Bug Log - changes from xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05_FULL -> xe-pw-160717v12_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160717v12_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160717v12_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160717v12_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-bmg:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-bmg:          NOTRUN -> [FAIL][2] +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-lnl:          NOTRUN -> [SKIP][3] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-1/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +258 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][6] +49 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise.html

  
#### Warnings ####

  * igt@xe_exec_system_allocator@process-many-stride-new-busy:
    - shard-bmg:          [SKIP][7] ([Intel XE#8589]) -> [DMESG-WARN][8] +9 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-new-busy.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@xe_exec_system_allocator@process-many-stride-new-busy.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - {shard-ptl}:        NOTRUN -> [SKIP][9] +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-1/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@runner@aborted:
    - {shard-ptl}:        NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-4/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in xe-pw-160717v12_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#610] / [Intel XE#7387])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7679])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#3432]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +12 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2724] / [Intel XE#7449])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325] / [Intel XE#7358])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7358])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2252]) +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#6507])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#6974])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2390] / [Intel XE#6974]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7642])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2320]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1424])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#9009])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#8265]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#301]) +2 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7178] / [Intel XE#7349])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7178] / [Intel XE#7351])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7905]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7061]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#4141]) +14 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#656] / [Intel XE#7905]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2311]) +54 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6312])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7399])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7865]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2313]) +48 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          NOTRUN -> [ABORT][47] ([Intel XE#1727])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6901])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6911] / [Intel XE#7378])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8348])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          NOTRUN -> [ABORT][51] ([Intel XE#9093]) +1 other test abort
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#8303]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7283]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2393])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#5020] / [Intel XE#7348])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#8396]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#8395] / [Intel XE#8396]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#8399])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7794])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2893] / [Intel XE#7304])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1489]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2330] / [Intel XE#5813])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2413])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#6503]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#8370])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_evict@evict-threads-small-multi-queue.html
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#6540] / [Intel XE#688])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-2/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_balancer@twice-parallel-basic:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7482])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-1/igt@xe_exec_balancer@twice-parallel-basic.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#8374]) +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#8374])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#8364]) +22 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#8364]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#8369])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [FAIL][80] ([Intel XE#9096])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#8378]) +8 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@xe_media_fill@media-fill.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#6964]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-3/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#7793])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2236] / [Intel XE#7590])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#584] / [Intel XE#7369])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-3/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2284] / [Intel XE#7370])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#944])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:
    - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#7992]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][91] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [FAIL][93] ([Intel XE#6078]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][95] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@d-edp1:
    - {shard-ptl}:        [FAIL][97] ([Intel XE#3149] / [Intel XE#3321]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@kms_flip@flip-vs-expired-vblank@d-edp1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-7/igt@kms_flip@flip-vs-expired-vblank@d-edp1.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-bmg:          [DMESG-FAIL][99] -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [INCOMPLETE][101] ([Intel XE#9272]) -> [PASS][102] +1 other test pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - {shard-ptl}:        [FAIL][103] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - {shard-ptl}:        [FAIL][105] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][106] +4 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_configfs@ctx-restore-mid-bb-invalid:
    - shard-bmg:          [ABORT][107] ([Intel XE#8007]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][109] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-bmg:          [SKIP][111] ([Intel XE#8589]) -> [PASS][112] +64 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][113] ([Intel XE#9096]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [SKIP][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-7/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-7/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_module_load@load.html
    - {shard-ptl}:        ([PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [SKIP][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191]) ([Intel XE#9286]) -> ([PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-1/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-7/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-7/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-7/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-1/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-6/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-6/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-6/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-1/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-5/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-3/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-6/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-7/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-7/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-2/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-8/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-2/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-6/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-6/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-5/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-8/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-8/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-4/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-1/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-3/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-6/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-5/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-1/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][216] ([Intel XE#8589]) -> [SKIP][217] ([Intel XE#2327]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][218] ([Intel XE#8589]) -> [SKIP][219] ([Intel XE#1124])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][220] ([Intel XE#8589]) -> [SKIP][221] ([Intel XE#2887]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          [SKIP][222] ([Intel XE#8589]) -> [SKIP][223] ([Intel XE#2252])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][224] ([Intel XE#8589]) -> [SKIP][225] ([Intel XE#8265])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][226] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][227] ([Intel XE#301])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][228] ([Intel XE#8589]) -> [SKIP][229] ([Intel XE#2311]) +6 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][230] ([Intel XE#8589]) -> [SKIP][231] ([Intel XE#4141]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][232] ([Intel XE#8589]) -> [SKIP][233] ([Intel XE#2313]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][234] ([Intel XE#8589]) -> [SKIP][235] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][236] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][237] ([Intel XE#3544])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][238] ([Intel XE#1503]) -> [ABORT][239] ([Intel XE#1727])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][240] ([Intel XE#8589]) -> [SKIP][241] ([Intel XE#6911] / [Intel XE#7466])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][242] ([Intel XE#8589]) -> [SKIP][243] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][244] ([Intel XE#8710]) -> [SKIP][245] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][246] ([Intel XE#8589]) -> [SKIP][247] ([Intel XE#1489]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][248] ([Intel XE#8589]) -> [SKIP][249] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][250] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][251] ([Intel XE#1729] / [Intel XE#7424])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][252] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][253] ([Intel XE#2509] / [Intel XE#7437])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          [SKIP][254] ([Intel XE#8589]) -> [ABORT][255] ([Intel XE#8868])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@sriov_basic@pf-unbind-with-vf-probed.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-bmg:          [SKIP][256] ([Intel XE#8589]) -> [SKIP][257] ([Intel XE#2322] / [Intel XE#7372])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_basic@multigpu-once-rebind.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch:
    - shard-bmg:          [SKIP][258] ([Intel XE#8589]) -> [SKIP][259] ([Intel XE#8374]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr:
    - shard-bmg:          [SKIP][260] ([Intel XE#8589]) -> [SKIP][261] ([Intel XE#8364]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][262] ([Intel XE#8589]) -> [SKIP][263] ([Intel XE#8369])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:
    - shard-bmg:          [SKIP][264] ([Intel XE#8589]) -> [SKIP][265] ([Intel XE#8378])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html

  * igt@xe_page_reclaim@many-vma-same-bo:
    - shard-bmg:          [SKIP][266] ([Intel XE#8589]) -> [SKIP][267] ([Intel XE#7793])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_page_reclaim@many-vma-same-bo.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_page_reclaim@many-vma-same-bo.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [INCOMPLETE][268] ([Intel XE#9263]) -> [FAIL][269] ([Intel XE#7695])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@xe_pat@pat-sw-hw-suspend.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][270] ([Intel XE#8589]) -> [DMESG-WARN][271] ([Intel XE#8963])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5878]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9263
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9272]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9272
  [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9100 -> IGT_9101
  * Linux: xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05 -> xe-pw-160717v12

  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9101: 16e3ae670fa6c3ee97f113c688a172bb0f6034e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05: 15f7465765dc45d58738fc05a1c11a785e709c05
  xe-pw-160717v12: 160717v12

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/index.html

--===============1567665484308364769==
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
<tr><td><b>Series:</b></td><td>Crescent Island PMT support (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/160717/">https://patchwork.freedesktop.org/series/160717/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-160717v12/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-160717v12/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5778-15f7465765dc45d58738fc05a1c11a785=
e709c05_FULL -&gt; xe-pw-160717v12_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160717v12_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-160717v12_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1607=
17v12_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@kms_cdclk@mode-rejected-max-=
dotclock.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_hdmi_audio_bw@audio-bw-h=
blank160.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-1/igt@kms_hdmi_audio_bw@audio-bw-h=
blank80.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@xe_exec_=
system_allocator@process-many-large-execqueues-free-madvise.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/=
shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-fre=
e-madvise.html">DMESG-WARN</a> +258 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-madvise:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-large-execqueues-malloc-madvise.html">DMESG-WARN</a> +4=
9 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_system_allocator@process-many-stride-new-busy:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-stride-new-busy.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/=
shard-bmg-6/igt@xe_exec_system_allocator@process-many-stride-new-busy.html"=
>DMESG-WARN</a> +9 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>{shard-ptl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-ptl-1/igt@kms_hdmi_audio_bw@audio-bw-h=
blank80.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>{shard-ptl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-ptl-4/igt@runner@aborted.html">FAIL</a=
></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160717v12_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_big_fb@yf-tiled-16bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_bw@connected-linear-tili=
ng-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-3/igt@kms_bw@linear-tiling-2-displ=
ays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_chamelium_color@ctm-nega=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_chamelium_color_pipelin=
e@plane-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_chamelium_frames@hdmi-as=
pect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_chamelium_sharpness_filt=
er@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@kms_content_protection@dp-ms=
t-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_content_protection@lic-t=
ype-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_cursor_crc@cursor-onscre=
en-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-=
movement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@kms_dp_linktrain_fallback@uh=
br-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-3/igt@kms_flip@flip=
-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel X=
E#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_frontbuffer_tracking@drr=
s-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-5/igt@kms_frontbuffer_tracking@drr=
shdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_frontbuffer_tracking@dr=
rshdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
drrshdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +54 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc=
drrshdr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc=
drrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr=
-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +48 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-h=
dmi-a-3-xrgb2101010.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_pipe_crc_basic@suspend-=
read-crc.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9093">Intel XE#9093</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_plane@pixel-format-4-til=
ed-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_plane@pixel-format-y-til=
ed-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_plane_lowres@tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@kms_plane_multiple@tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6=
886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@kms_pm_dc@dc3co-after-dc6@ps=
r2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8396">Intel XE#8396</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-framegap=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8396">Intel XE#8396</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-2/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-160717v12/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Inte=
l XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_pm_dc@dc6-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794"=
>Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-pl=
ane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_psr2_sf@psr2-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plan=
e-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_scaling_modes@scaling-m=
ode-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@kms_sharpness_filter@invalid=
-filter-with-nearest-neighbor.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-d=
rrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1499">Intel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@xe_create@multigpu-create-ma=
ssive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2504">Intel XE#2504</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_evict@evict-threads-small=
-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8370">Intel XE#8370</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-2/igt@xe_evict@evict-threads-small=
-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-1/igt@xe_exec_balancer@twice-paral=
lel-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@xe_exec_basic@multigpu-once-=
null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@xe_exec_fault_mode@once-mult=
i-queue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-8/igt@xe_exec_fault_mode@twice-mul=
ti-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_exec_multi_queue@few-exec=
s-preempt-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +22 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-1/igt@xe_exec_multi_queue@few-exec=
s-preempt-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue=
-close-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_exec_threads@threads-han=
g-userptr-invalidate-race.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@xe_exec_threads@threads-mult=
i-queue-mixed-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@xe_media_fill@media-fill.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2596">Intel XE#2596</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-3/igt@xe_multigpu_svm@mgpu-migrati=
on-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6964">Intel XE#6964</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@xe_page_reclaim@prl-max-entr=
ies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
236">Intel XE#2236</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-lnl-3/igt@xe_pm@s3-vm-bind-unbind-all.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_query@multigpu-query-inva=
lid-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvf=
s-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_sriov_auto_provisioning@r=
esources-released-on-vfs-disabling@numvfs-random.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a=
>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1=
2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-b-dp-2.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/=
shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/sha=
rd-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-edp1:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@kms_flip=
@flip-vs-expired-vblank@d-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/s=
hard-ptl-7/igt@kms_flip@flip-vs-expired-vblank@d-edp1.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_rota=
tion_crc@multiplane-rotation-cropping-bottom.html">DMESG-FAIL</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg=
-5/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@kms_vbla=
nk@ts-continuation-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9272">Intel XE#9272</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/i=
gt@kms_vblank@ts-continuation-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@kms_vrr@=
flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/=
shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@kms_vrr@=
flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-=
ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +4 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-mid-bb-invalid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/igt@xe_conf=
igfs@ctx-restore-mid-bb-invalid.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/i=
gt@xe_configfs@ctx-restore-mid-bb-invalid.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-160717v12/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eoch=
eck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">I=
ntel XE#8589</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-160717v12/shard-bmg-10/igt@xe_exec_system_allocator@many-large-mmap=
-shared-remap-dontunmap-eocheck.html">PASS</a> +64 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-6/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/s=
hard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-=
bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c0=
5/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e7=
09c05/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a7=
85e709c05/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c=
11a785e709c05/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738f=
c05a1c11a785e709c05/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58=
738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc4=
5d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f746576=
5dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f74=
65765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-1=
5f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-=
8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c0=
5/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e7=
09c05/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-160717v12/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-160717v12/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/=
shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-160717v12/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16071=
7v12/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-160717v12/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
160717v12/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-160717v12/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16071=
7v12/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>)</li>
<li>{shard-ptl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-p=
tl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/sha=
rd-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05=
/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e70=
9c05/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a78=
5e709c05/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c1=
1a785e709c05/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05=
a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738=
fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d5=
8738fc05a1c11a785e709c05/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc=
45d58738fc05a1c11a785e709c05/shard-ptl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f74657=
65dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7=
465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-=
15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-=
ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/sh=
ard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c0=
5/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9286">Intel XE#9286</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-=
ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-160717v12/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-160717v12/shard-ptl-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/s=
hard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-160717v12/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-160717v12/shard-ptl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717=
v12/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-160717v12/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-pt=
l-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
60717v12/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-160717v12/shard-ptl-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/sha=
rd-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-160717v12/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-ptl-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-160717v12/shard-ptl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717=
v12/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_big_=
fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_=
big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1607=
17v12/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-asyn=
c-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/sha=
rd-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">I=
ntel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_cham=
elium_frames@dp-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms=
_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_dsc@=
dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@kms_dsc@dsc-with=
-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-lnl-=
3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8=
589</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
60717v12/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indf=
b-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1607=
17v12/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#858=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160=
717v12/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pl=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/s=
hard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/706=
1">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/=
igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-7/igt@kms_hdr@invalid-hd=
r.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-9/igt@km=
s_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/i=
gt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#=
6912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-2/i=
gt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#=
3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
383">Intel XE#7383</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_psr2=
_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/sh=
ard-bmg-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"=
>Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_psr@=
pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-1/igt@kms_psr@=
pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/sha=
rd-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424"=
>Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-160717v12/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@sriov_ba=
sic@pf-unbind-with-vf-probed.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-8/igt@s=
riov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@xe_=
exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
fault_mode@once-multi-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/sh=
ard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374"=
>Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
multi_queue@two-queues-preempt-mode-fault-userptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1607=
17v12/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard=
-bmg-9/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel=
 XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
threads@threads-multi-queue-shared-vm-basic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/sh=
ard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378"=
>Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@many-vma-same-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_page_=
reclaim@many-vma-same-bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-10/igt@xe_p=
age_reclaim@many-vma-same-bo.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@xe_pat@p=
at-sw-hw-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9263">Intel XE#9263</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-5/igt@xe_pat@=
pat-sw-hw-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_wedge=
d@wedged-at-any-timeout.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v12/shard-bmg-4/igt@xe_wed=
ged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9100 -&gt; IGT_9101</li>
<li>Linux: xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05 -&gt; xe-pw-160=
717v12</li>
</ul>
<p>IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_9101: 16e3ae670fa6c3ee97f113c688a172bb0f6034e7 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05: 15f7465765dc45d58738fc0=
5a1c11a785e709c05<br />
  xe-pw-160717v12: 160717v12</p>

</body>
</html>

--===============1567665484308364769==--
