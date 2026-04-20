Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E704AF5A8BC
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 21:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873AB10E74F;
	Mon, 20 Apr 2026 21:39:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D1F10E74D;
 Mon, 20 Apr 2026 21:39:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4930487872896870734=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_clear-error-counter_co?=
 =?utf-8?q?mmand_to_drm=5Fras_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Apr 2026 21:39:08 -0000
Message-ID: <177672114883.478721.16927716776203591310@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409073318.2909379-4-riana.tauro@intel.com>
In-Reply-To: <20260409073318.2909379-4-riana.tauro@intel.com>
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

--===============4930487872896870734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add clear-error-counter command to drm_ras (rev2)
URL   : https://patchwork.freedesktop.org/series/164601/
State : failure

== Summary ==

CI Bug Log - changes from xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201_FULL -> xe-pw-164601v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-164601v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-164601v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-164601v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-8/igt@xe_module_load@reload-no-display.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  
Known issues
------------

  Here are the changes found in xe-pw-164601v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#5354])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-bmg:          [PASS][11] -> [DMESG-WARN][12] ([Intel XE#7725]) +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2311]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#1503])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [DMESG-FAIL][16] ([Intel XE#5545]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][18] ([Intel XE#4459]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][20] ([Intel XE#6321]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][22] ([Intel XE#5625]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset:
    - shard-bmg:          [SKIP][24] ([Intel XE#6703]) -> [PASS][25] +89 other tests pass
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][26] ([Intel XE#6703]) -> [SKIP][27] ([Intel XE#1124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][28] ([Intel XE#6703]) -> [SKIP][29] ([Intel XE#367] / [Intel XE#7354])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][30] ([Intel XE#6703]) -> [SKIP][31] ([Intel XE#2652])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][32] ([Intel XE#6703]) -> [SKIP][33] ([Intel XE#2887]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          [SKIP][34] ([Intel XE#6703]) -> [SKIP][35] ([Intel XE#2252])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-bmg:          [SKIP][36] ([Intel XE#6703]) -> [SKIP][37] ([Intel XE#2320])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_cursor_crc@cursor-random-max-size.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][38] ([Intel XE#6703]) -> [SKIP][39] ([Intel XE#6126] / [Intel XE#776])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_fbcon_fbt@psr.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][40] ([Intel XE#6703]) -> [SKIP][41] ([Intel XE#4141]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][42] ([Intel XE#6703]) -> [SKIP][43] ([Intel XE#2311]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][44] ([Intel XE#6703]) -> [SKIP][45] ([Intel XE#2313]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][46] ([Intel XE#2312]) -> [SKIP][47] ([Intel XE#2313])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][48] ([Intel XE#3544]) -> [SKIP][49] ([Intel XE#3374] / [Intel XE#3544])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][50] ([Intel XE#6703]) -> [SKIP][51] ([Intel XE#4090] / [Intel XE#7443])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-bmg:          [SKIP][52] ([Intel XE#6703]) -> [SKIP][53] ([Intel XE#7283])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][54] ([Intel XE#6703]) -> [SKIP][55] ([Intel XE#2499])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][56] ([Intel XE#6703]) -> [SKIP][57] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_psr@psr-basic.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_psr@psr-basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][58] ([Intel XE#6703]) -> [SKIP][59] ([Intel XE#1435])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][60] ([Intel XE#6703]) -> [SKIP][61] ([Intel XE#6503])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][62] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][63] ([Intel XE#2509] / [Intel XE#7437])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-bmg:          [SKIP][64] ([Intel XE#6703]) -> [SKIP][65] ([Intel XE#7636]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_eudebug@basic-exec-queues-enable.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          [SKIP][66] ([Intel XE#6703]) -> [SKIP][67] ([Intel XE#7140])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_evict@evict-small-multi-queue.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          [SKIP][68] ([Intel XE#6703]) -> [SKIP][69] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:
    - shard-bmg:          [SKIP][70] ([Intel XE#6703]) -> [SKIP][71] ([Intel XE#7136])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-basic:
    - shard-bmg:          [SKIP][72] ([Intel XE#6703]) -> [SKIP][73] ([Intel XE#6874]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:
    - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [SKIP][75] ([Intel XE#7138])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([SKIP][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [SKIP][107], [PASS][108], [PASS][109], [DMESG-WARN][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7725])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-8/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-6/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-6/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-8/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-8/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-4/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-3/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-3/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-10/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-10/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-10/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-1/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-1/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-1/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-9/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-9/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-7/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-7/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-4/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-8/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-8/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-8/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-6/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-6/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-6/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-6/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-6/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-4/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-7/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-7/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-5/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-5/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-4/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-9/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-9/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-2/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-2/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-2/igt@xe_module_load@load.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776


Build changes
-------------

  * Linux: xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201 -> xe-pw-164601v2

  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201: da91cb4e6137507f74e4da41c39d0260b4cd1201
  xe-pw-164601v2: 164601v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/index.html

--===============4930487872896870734==
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
<tr><td><b>Series:</b></td><td>Add clear-error-counter command to drm_ras (=
rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164601/">https://patchwork.freedesktop.org/series/164601/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-164601v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-164601v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4920-da91cb4e6137507f74e4da41c39d0260b=
4cd1201_FULL -&gt; xe-pw-164601v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-164601v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-164601v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1646=
01v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@reload-no-display:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-8/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-8/igt@xe_module_load@reloa=
d-no-display.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164601v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/igt@kms_async_=
flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/i=
gt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE=
#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164601v2/shard-bmg-4/igt@kms_ccs@bad-aux-stride-yf-til=
ed-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/igt@kms_=
cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-4/igt@kms_flip=
@flip-vs-suspend@a-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-3/igt@kms_flip@flip-vs-s=
uspend@a-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>) +1 other test dmesg-war=
n</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164601v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-1/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-164601v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE=
#5545</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-164601v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-lnl-3/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-lnl-5/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-4/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shar=
d-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-lnl-3/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#=
5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
164601v2/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx=
-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-many-stride-malloc-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164=
601v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-malloc-n=
omemset.html">PASS</a> +89 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/s=
hard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
24">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_bw@l=
inear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/=
igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel =
XE#7354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_ccs@=
bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/ig=
t@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_ccs@=
crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1=
/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_cham=
elium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/=
igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_curs=
or_crc@cursor-random-max-size.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@k=
ms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_fbco=
n_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_fbcon_fbt@psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6126">Intel XE#6126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
64601v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-164601v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1646=
01v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/sha=
rd-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">=
Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-6/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-7/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard=
-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Inte=
l XE#4090</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_plan=
e@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1=
/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_psr@=
psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms_psr@psr-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_setm=
ode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@kms=
_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@kms_shar=
pness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/s=
hard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
03">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-164601v2/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_eudeb=
ug@basic-exec-queues-enable.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_=
eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_evict=
@evict-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_evi=
ct@evict-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164=
601v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindex=
ecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_=
fault_mode@many-multi-queue-userptr-imm.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-b=
mg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE=
#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_=
multi_queue@many-queues-preempt-mode-basic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shar=
d-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">In=
tel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_exec_=
threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
164601v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-u=
serptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-8/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd=
1201/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260=
b4cd1201/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d=
0260b4cd1201/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41=
c39d0260b4cd1201/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4=
da41c39d0260b4cd1201/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f=
74e4da41c39d0260b4cd1201/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137=
507f74e4da41c39d0260b4cd1201/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e=
6137507f74e4da41c39d0260b4cd1201/shard-bmg-10/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4920-da9=
1cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-10/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-492=
0-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-10/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-bmg-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd=
1201/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#=
7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-164601v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-164601v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-164601v2/shard-bmg-6/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-164601v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard=
-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-164601v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-164601v2/shard-bmg-10/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601=
v2/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-164601v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16460=
1v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-164601v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-9/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16460=
1v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-164601v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#=
2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
405">Intel XE#7405</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201 -&gt; xe-pw-164=
601v2</li>
</ul>
<p>IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201: da91cb4e6137507f74e4da4=
1c39d0260b4cd1201<br />
  xe-pw-164601v2: 164601v2</p>

</body>
</html>

--===============4930487872896870734==--
