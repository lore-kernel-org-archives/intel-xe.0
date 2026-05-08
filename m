Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219FECD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 23:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F1610E031;
	Fri,  8 May 2026 23:38:26 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC4310E031;
 Fri,  8 May 2026 23:38:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1871849173997692664=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915=3A_reorganize_dis?=
 =?utf-8?q?play_documentation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 May 2026 23:38:24 -0000
Message-ID: <177828350490.53706.18295203004607485009@5ab824fced77>
X-Patchwork-Hint: ignore
References: <cover.1778235406.git.jani.nikula@intel.com>
In-Reply-To: <cover.1778235406.git.jani.nikula@intel.com>
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

--===============1871849173997692664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: reorganize display documentation
URL   : https://patchwork.freedesktop.org/series/166200/
State : failure

== Summary ==

CI Bug Log - changes from xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd_FULL -> xe-pw-166200v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166200v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166200v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166200v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-blt.html

  
Known issues
------------

  Here are the changes found in xe-pw-166200v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#3279])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#7679])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#7084]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2320])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2291])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][11] -> [ABORT][12] ([Intel XE#1727])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2291] / [Intel XE#7343])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#3321]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2316]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [PASS][19] -> [DMESG-FAIL][20] ([Intel XE#5208])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][21] -> [DMESG-FAIL][22] ([Intel XE#5545])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#7865]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#7905]) +12 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#656] / [Intel XE#7905]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#1503] / [Intel XE#7915])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#7915]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#1435])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7136])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#6874])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#6703]) +9 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [FAIL][38] -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@fbdev@unaligned-write.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@fbdev@unaligned-write.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][40] ([Intel XE#6703]) -> [PASS][41] +83 other tests pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][42] ([Intel XE#3321]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][44] ([Intel XE#1503]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][46] ([Intel XE#7922]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][48] ([Intel XE#7915]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-3/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-5/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-bmg:          [SKIP][50] -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_pm_dc@dc5-dpms.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@xe_exec_system_allocator@twice-large-free:
    - shard-lnl:          [INCOMPLETE][52] ([Intel XE#2594]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-free.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-free.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][54] ([Intel XE#7914]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][56] ([Intel XE#6703]) -> [SKIP][57] ([Intel XE#2327])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][58] ([Intel XE#6703]) -> [SKIP][59] ([Intel XE#1124])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][60] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][61] ([Intel XE#7642]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_content_protection@legacy.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][62] ([Intel XE#6703]) -> [SKIP][63] ([Intel XE#4422] / [Intel XE#7442])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][64] ([Intel XE#6703]) -> [SKIP][65] ([Intel XE#2374] / [Intel XE#6127])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_feature_discovery@psr1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][66] ([Intel XE#6703]) -> [SKIP][67] ([Intel XE#7178] / [Intel XE#7351])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][68] ([Intel XE#6703]) -> [SKIP][69] ([Intel XE#2311]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][70] ([Intel XE#2311]) -> [SKIP][71] ([Intel XE#2312] / [Intel XE#7905]) +12 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][72] ([Intel XE#4141]) -> [SKIP][73] ([Intel XE#6703])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][74] ([Intel XE#4141]) -> [SKIP][75] ([Intel XE#2312] / [Intel XE#7905]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][76] ([Intel XE#6703]) -> [SKIP][77] ([Intel XE#4141]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][78] ([Intel XE#2311]) -> [SKIP][79] ([Intel XE#7905]) +9 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][80] ([Intel XE#6703]) -> [SKIP][81] ([Intel XE#2313]) +8 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][82] ([Intel XE#2313]) -> [SKIP][83] ([Intel XE#7905]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-onoff.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][84] ([Intel XE#2313]) -> [SKIP][85] ([Intel XE#2312] / [Intel XE#7905]) +12 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-bmg:          [SKIP][86] ([Intel XE#2313]) -> [SKIP][87] ([Intel XE#6703]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][88] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][89] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][90] ([Intel XE#7916]) -> [SKIP][91] ([Intel XE#7915]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][92] ([Intel XE#6703]) -> [SKIP][93] ([Intel XE#4298] / [Intel XE#5873])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][94] ([Intel XE#6911] / [Intel XE#7378]) -> [SKIP][95] ([Intel XE#6703])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][96] ([Intel XE#6703]) -> [SKIP][97] ([Intel XE#1489]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][98] ([Intel XE#1489]) -> [SKIP][99] ([Intel XE#6703])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][100] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][101] ([Intel XE#6703])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_psr2_su@page_flip-nv12.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-bmg:          [SKIP][102] ([Intel XE#6703]) -> [SKIP][103] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_psr@fbc-psr-primary-page-flip.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][104] ([Intel XE#6703]) -> [SKIP][105] ([Intel XE#3904] / [Intel XE#7342])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][106] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][107] ([Intel XE#6703])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][108] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][109] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][110] ([Intel XE#6703]) -> [SKIP][111] ([Intel XE#6503])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][112] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][113] ([Intel XE#2426] / [Intel XE#5848])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          [SKIP][114] ([Intel XE#6703]) -> [SKIP][115] ([Intel XE#7636])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_eudebug@basic-exec-queues.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-bmg:          [SKIP][116] ([Intel XE#7636]) -> [SKIP][117] ([Intel XE#6703])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][118] ([Intel XE#6703]) -> [SKIP][119] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-bmg:          [SKIP][120] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][121] ([Intel XE#6703])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind:
    - shard-bmg:          [SKIP][122] ([Intel XE#6703]) -> [SKIP][123] ([Intel XE#7136])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-rebind.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][124] ([Intel XE#7136]) -> [SKIP][125] ([Intel XE#6703])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][126] ([Intel XE#6703]) -> [SKIP][127] ([Intel XE#6874]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          [SKIP][128] ([Intel XE#6703]) -> [SKIP][129] ([Intel XE#7138])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][130] ([Intel XE#5694] / [Intel XE#7370]) -> [SKIP][131] ([Intel XE#6703])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@xe_pm@d3cold-i2c.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][132] ([Intel XE#6703]) -> [SKIP][133] ([Intel XE#2284] / [Intel XE#7370])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          [SKIP][134] ([Intel XE#6703]) -> [SKIP][135] ([Intel XE#4733] / [Intel XE#7417])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][136] ([Intel XE#6703]) -> [FAIL][137] ([Intel XE#6569])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922


Build changes
-------------

  * Linux: xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd -> xe-pw-166200v1

  IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd: 680a4832a8182b13ac5d55ab0c03c54ebc2baadd
  xe-pw-166200v1: 166200v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/index.html

--===============1871849173997692664==
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
<tr><td><b>Series:</b></td><td>drm/i915: reorganize display documentation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166200/">https://patchwork.freedesktop.org/series/166200/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd_FULL -&gt; xe-pw-166200v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166200v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166200v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166200v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-blt:<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-blt.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166200v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-256x256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@fbdev@unaligned-write.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +83 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-3/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-5/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_pm_dc@dc5-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-free:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-free.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-8/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166200v1/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd -&gt; xe-pw-166200v1</li>
</ul>
<p>IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5025-680a4832a8182b13ac5d55ab0c03c54ebc2baadd: 680a4832a8182b13ac5d55ab0c03c54ebc2baadd<br />
  xe-pw-166200v1: 166200v1</p>

</body>
</html>

--===============1871849173997692664==--
