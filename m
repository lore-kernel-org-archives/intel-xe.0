Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6059CCFA18
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 06:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A53810E11B;
	Tue, 11 Nov 2025 06:41:36 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406FA10E097;
 Tue, 11 Nov 2025 06:41:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8487230867170867803=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/pat=3A_Add_helper_t?=
 =?utf-8?q?o_query_compression_enable_status?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wang, X" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Nov 2025 06:41:35 -0000
Message-ID: <176284329525.39844.4213027541032607429@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251110221458.1864507-1-x.wang@intel.com>
In-Reply-To: <20251110221458.1864507-1-x.wang@intel.com>
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

--===============8487230867170867803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pat: Add helper to query compression enable status
URL   : https://patchwork.freedesktop.org/series/157352/
State : failure

== Summary ==

CI Bug Log - changes from xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6_FULL -> xe-pw-157352v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157352v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157352v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157352v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-157352v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#2953] / [Intel XE#4173]) +9 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][6] -> [DMESG-FAIL][7] ([Intel XE#4543]) +1 other test dmesg-fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][11] ([Intel XE#3862]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][12] -> [INCOMPLETE][13] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2325]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2252])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#1178]) +2 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2321])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2291]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][23] -> [FAIL][24] ([Intel XE#1475])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-bmg:          [PASS][25] -> [DMESG-WARN][26] ([Intel XE#5354]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_cursor_legacy@single-bo.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-4/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2316]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-1/igt@kms_flip@2x-plain-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#301]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#4543]) +5 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][33] -> [DMESG-WARN][34] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5208])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][35] -> [FAIL][36] ([Intel XE#3098]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-5/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2293]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#5390]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2311]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2313]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#1503])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#3309])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-adlp:         [PASS][45] -> [DMESG-WARN][46] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5750])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@kms_pm_rpm@universal-planes.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-4/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_psr@psr-no-drrs.html

  * igt@kms_setmode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][49] -> [FAIL][50] ([Intel XE#6361])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-4/igt@kms_setmode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-2/igt@kms_setmode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1499])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4837]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2322]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#5007])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html

  * igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:
    - shard-bmg:          [PASS][55] -> [ABORT][56] ([Intel XE#3970])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-5/igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo.html

  * igt@xe_exec_system_allocator@twice-large-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4943]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_exec_system_allocator@twice-large-mmap-new-huge.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [PASS][58] -> [DMESG-WARN][59] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#6255])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#4733])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#944])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [PASS][64] -> [DMESG-FAIL][65] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][66] ([Intel XE#3908]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][68] ([Intel XE#4543]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][70] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][72] ([Intel XE#2291]) -> [PASS][73] +7 other tests pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][74] ([Intel XE#3009]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_dp_aux_dev.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][76] ([Intel XE#4294]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][78] ([Intel XE#3321]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [SKIP][80] ([Intel XE#2316]) -> [PASS][81] +7 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][82] ([Intel XE#5338] / [Intel XE#6266]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][84] ([Intel XE#6266]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][86] ([Intel XE#301]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][88] ([Intel XE#4543]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-2/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][90] ([Intel XE#1503]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_hdr@static-swap.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-4/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][92] ([Intel XE#3012]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][94] ([Intel XE#4596]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [FAIL][96] ([Intel XE#6361]) -> [PASS][97] +2 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@kms_setmode@basic.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-2/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][98] ([Intel XE#6361]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][100] ([Intel XE#1435]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [SKIP][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127]) ([Intel XE#378]) -> ([PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-434/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-434/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-434/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-464/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-464/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-464/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-464/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-433/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-433/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-433/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-436/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-436/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-436/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-463/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-463/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-463/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-466/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-466/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-466/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-435/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-435/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-435/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-432/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-432/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-432/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-432/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-466/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-434/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-435/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-432/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-432/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-435/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-463/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-464/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-464/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-464/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-433/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-466/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-433/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-433/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-436/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-436/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-463/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-435/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-463/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-436/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-436/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-435/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-434/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-466/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [DMESG-WARN][153] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-userptr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][155] ([Intel XE#1178]) -> [SKIP][156] ([Intel XE#2341])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-1/igt@kms_content_protection@atomic.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][157] ([Intel XE#2341]) -> [FAIL][158] ([Intel XE#1178])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_content_protection@legacy.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [FAIL][159] ([Intel XE#3098] / [Intel XE#5338] / [Intel XE#6266]) -> [FAIL][160] ([Intel XE#5338] / [Intel XE#6266])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][161] ([Intel XE#3098]) -> [FAIL][162] ([Intel XE#5338] / [Intel XE#6266])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][163] ([Intel XE#2312]) -> [SKIP][164] ([Intel XE#5390]) +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][165] ([Intel XE#5390]) -> [SKIP][166] ([Intel XE#2312]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][167] ([Intel XE#2312]) -> [SKIP][168] ([Intel XE#2311]) +19 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][169] ([Intel XE#2311]) -> [SKIP][170] ([Intel XE#2312]) +7 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][171] ([Intel XE#2312]) -> [SKIP][172] ([Intel XE#2313]) +19 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][173] ([Intel XE#2313]) -> [SKIP][174] ([Intel XE#2312]) +7 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][175] ([Intel XE#5021]) -> [SKIP][176] ([Intel XE#4596])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][177] ([Intel XE#2426]) -> [FAIL][178] ([Intel XE#1729])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][179] ([Intel XE#2426]) -> [SKIP][180] ([Intel XE#2509])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         [SKIP][181] ([Intel XE#944]) -> [FAIL][182] ([Intel XE#6249])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5750
  [Intel XE#6249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6249
  [Intel XE#6255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6255
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6 -> xe-pw-157352v1

  IGT_8618: 8618
  xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6: a9792b1ab75123e4aceaba953a89809e745919c6
  xe-pw-157352v1: 157352v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/index.html

--===============8487230867170867803==
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
<tr><td><b>Series:</b></td><td>drm/xe/pat: Add helper to query compression =
enable status</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157352/">https://patchwork.freedesktop.org/series/157352/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157352v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-157352v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4084-a9792b1ab75123e4aceaba953a89809e7=
45919c6_FULL -&gt; xe-pw-157352v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157352v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-157352v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1573=
52v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-suspend:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-4/igt@kms_frontbuffe=
r_tracking@fbc-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157352v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@kms_ato=
mic_transition@plane-use-after-nonblocking-unbind.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-=
4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
53">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4173">Intel XE#4173</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/s=
hard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg=
2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#=
4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc=
-planes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_curs=
or_legacy@single-bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-4/igt@kms_cursor_legacy@single-=
bo.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5354">Intel XE#5354</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-1/igt@kms_flip=
@2x-plain-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-lnl-5/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-4/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-3/igt@kms_flip@=
flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +5 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-2/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5=
208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-5/igt@kms_flip=
@flip-vs-wf_vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_fl=
ip@flip-vs-wf_vblank-interruptible@a-dp2.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2=
380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-7/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@kms_pm_=
rpm@universal-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-4/igt@kms_pm_rpm@universal-pl=
anes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5750">Intel XE#5750</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_psr@psr-no-drrs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-4/igt@kms_setm=
ode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-2/igt@kms_set=
mode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_eudebug@basic-vm-access-fa=
ultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_exec_system_allocator@many=
-64k-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-5/igt@xe_exec_=
system_allocator@processes-evict-malloc-mix-bo.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/ig=
t@xe_exec_system_allocator@processes-evict-malloc-mix-bo.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel X=
E#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_exec_system_allocator@twic=
e-large-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@xe_pm@s=
2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-2/igt@xe_pm@s2idle-d3hot-ba=
sic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-433/igt@xe_pm@=
s3-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-157352v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6255">Intel XE#6255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post=
-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157352v1/shard-bmg-7/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-6/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets@numvfs-random.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adl=
p-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3868">Intel XE#3868</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5213">Intel XE#5213</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-=
fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1573=
52v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fe=
ncing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157352v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-157352v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-157352v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-=
bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8/igt@kms=
_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1573=
52v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-lnl-8/igt@kms_flip=
@blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-lnl-3/igt@kms_flip@bl=
ocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-lnl-7/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@kms_fli=
p@plain-flip-ts-check@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adl=
p-2/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-4/igt@kms_hdr@static-swap=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-8=
/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-9/igt@kms_set=
mode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-adlp-2/igt@kms_setmode@basic.h=
tml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-lnl-4/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-lnl-4/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bm=
g-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard=
-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e74=
5919c6/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89=
809e745919c6/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceab=
a953a89809e745919c6/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e=
4aceaba953a89809e745919c6/shard-dg2-433/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab=
75123e4aceaba953a89809e745919c6/shard-dg2-433/igt@xe_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a97=
92b1ab75123e4aceaba953a89809e745919c6/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-40=
84-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-d=
g2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e7459=
19c6/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba953a8980=
9e745919c6/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4aceaba95=
3a89809e745919c6/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab75123e4ac=
eaba953a89809e745919c6/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b1ab751=
23e4aceaba953a89809e745919c6/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-a9792b=
1ab75123e4aceaba953a89809e745919c6/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4084-=
a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-432/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-157352v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-43=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
7352v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-435/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-157352v1/shard-dg2-463/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/sh=
ard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-464/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-157352v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-466/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57352v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-433/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-157352v1/shard-dg2-436/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-463/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-157352v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-436/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
157352v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-435/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-157352v1/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/=
shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-2/igt@xe_pm@s=
2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#=
4504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
157352v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-1/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-4/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1573=
52v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266"=
>Intel XE#6266</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg=
-2/igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#533=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266=
">Intel XE#6266</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1573=
52v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57352v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157352v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
7352v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1573=
52v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1573=
52v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-6/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-6/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-bmg-1/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/sha=
rd-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6/shard-adlp-6/igt@xe_quer=
y@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157352v1/shard-=
adlp-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6249">Inte=
l XE#6249</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6 -&gt; xe-pw-157=
352v1</li>
</ul>
<p>IGT_8618: 8618<br />
  xe-4084-a9792b1ab75123e4aceaba953a89809e745919c6: a9792b1ab75123e4aceaba9=
53a89809e745919c6<br />
  xe-pw-157352v1: 157352v1</p>

</body>
</html>

--===============8487230867170867803==--
