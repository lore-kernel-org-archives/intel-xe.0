Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D695ACD5BB4
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC3610E256;
	Fri, 22 May 2026 14:15:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2721110E256;
 Fri, 22 May 2026 14:15:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2221759315526378891=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_gpu/buddy=3A_Per-order_fre?=
 =?utf-8?q?e_and_used_block_scoreboards_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 May 2026 14:15:12 -0000
Message-ID: <177945931215.12.401941317162247347@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260522092600.32818-1-francois.dugast@intel.com>
In-Reply-To: <20260522092600.32818-1-francois.dugast@intel.com>
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

--===============2221759315526378891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: Per-order free and used block scoreboards (rev5)
URL   : https://patchwork.freedesktop.org/series/165914/
State : success

== Summary ==

CI Bug Log - changes from xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f_FULL -> xe-pw-165914v5_FULL
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

  Here are the changes found in xe-pw-165914v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#5208])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_flip@2x-flip-vs-rmfb.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#5545] / [Intel XE#7774])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#301]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#7915]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-2/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-5/igt@kms_vrr@flip-basic.html

  * igt@xe_exec_system_allocator@threads-many-free:
    - shard-lnl:          [PASS][15] -> [ABORT][16] ([Intel XE#8007])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-free.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-1/igt@xe_exec_system_allocator@threads-many-free.html

  * igt@xe_pat@pt-caching-random-offsets:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#6703]) +93 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@xe_pat@pt-caching-random-offsets.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@xe_pat@pt-caching-random-offsets.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][19] ([Intel XE#7571]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][21] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][22] +1 other test pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][23] ([Intel XE#7915]) -> [PASS][24] +3 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-5/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][25] ([Intel XE#2142]) -> [PASS][26] +1 other test pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][27] ([Intel XE#6321]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][29] ([Intel XE#2327]) -> [SKIP][30] ([Intel XE#6703]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][31] ([Intel XE#1124]) -> [SKIP][32] ([Intel XE#6703])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][33] ([Intel XE#7679]) -> [SKIP][34] ([Intel XE#6703])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][35] ([Intel XE#2887]) -> [SKIP][36] ([Intel XE#6703]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][37] ([Intel XE#3432]) -> [SKIP][38] ([Intel XE#6703])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][39] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][40] ([Intel XE#6703])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_chamelium_color@gamma.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-bmg:          [SKIP][41] ([Intel XE#2252]) -> [SKIP][42] ([Intel XE#6703])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [FAIL][43] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][44] ([Intel XE#6703])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_content_protection@suspend-resume.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-bmg:          [SKIP][45] ([Intel XE#2320]) -> [SKIP][46] ([Intel XE#6703])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32x10.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][47] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][48] ([Intel XE#309] / [Intel XE#7343])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][49] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][50] ([Intel XE#6703])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][51] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][52] ([Intel XE#6703])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][53] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][54] ([Intel XE#6703])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][55] ([Intel XE#4141]) -> [SKIP][56] ([Intel XE#6703]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][57] ([Intel XE#2311]) -> [SKIP][58] ([Intel XE#6703]) +9 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][59] ([Intel XE#7061]) -> [SKIP][60] ([Intel XE#6703])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][61] ([Intel XE#2313]) -> [SKIP][62] ([Intel XE#6703]) +9 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][63] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][64] ([Intel XE#6703])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][65] ([Intel XE#7283]) -> [SKIP][66] ([Intel XE#6703])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][67] ([Intel XE#2393]) -> [SKIP][68] ([Intel XE#6703])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_plane_lowres@tiling-y.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][69] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][70] ([Intel XE#6703])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-bmg:          [SKIP][71] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][72] ([Intel XE#6703]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_psr@fbc-psr-basic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          [SKIP][73] ([Intel XE#6503]) -> [SKIP][74] ([Intel XE#6703])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_sharpness_filter@filter-strength.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_sharpness_filter@filter-strength.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][75] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][76] ([Intel XE#2426] / [Intel XE#5848])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][77] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][78] ([Intel XE#2426] / [Intel XE#5848])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-bmg:          [SKIP][79] ([Intel XE#7636]) -> [SKIP][80] ([Intel XE#6703]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  * igt@xe_exec_multi_queue@one-queue-close-fd-smem:
    - shard-bmg:          [SKIP][81] ([Intel XE#6874]) -> [SKIP][82] ([Intel XE#6703]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][83] ([Intel XE#7098]) -> [INCOMPLETE][84] ([Intel XE#7098] / [Intel XE#8159])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-bmg:          [SKIP][85] ([Intel XE#7793]) -> [SKIP][86] ([Intel XE#6703])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@xe_page_reclaim@binds-full-pd.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][87] ([Intel XE#6569]) -> [SKIP][88] ([Intel XE#6557] / [Intel XE#6703])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159


Build changes
-------------

  * Linux: xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f -> xe-pw-165914v5

  IGT_8935: 8935
  xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f: 7e25390024f8a4a9fdd6ec50f000ee25c006c02f
  xe-pw-165914v5: 165914v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/index.html

--===============2221759315526378891==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: Per-order free and used block scoreboards (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165914/">https://patchwork.freedesktop.org/series/165914/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f_FULL -&gt; xe-pw-165914v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165914v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_flip@2x-flip-vs-rmfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-2/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-1/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-5/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-free:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-1/igt@xe_exec_system_allocator@threads-many-free.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pt-caching-random-offsets:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@xe_pat@pt-caching-random-offsets.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@xe_pat@pt-caching-random-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +93 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-5/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165914v5/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f -&gt; xe-pw-165914v5</li>
</ul>
<p>IGT_8935: 8935<br />
  xe-5114-7e25390024f8a4a9fdd6ec50f000ee25c006c02f: 7e25390024f8a4a9fdd6ec50f000ee25c006c02f<br />
  xe-pw-165914v5: 165914v5</p>

</body>
</html>

--===============2221759315526378891==--
