Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BB2CDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 23:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C8710E0BA;
	Wed, 24 Jun 2026 23:39:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F57B10E0BA;
 Wed, 24 Jun 2026 23:39:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0478645404810883456=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/vm=3A_Fix_BO_prefet?=
 =?utf-8?q?ch_with_CONSULT=5FMEM=5FADVISE=5FPREF=5FLOC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jun 2026 23:39:06 -0000
Message-ID: <178234434611.114390.7150025098157871441@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
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

--===============0478645404810883456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC (rev2)
URL   : https://patchwork.freedesktop.org/series/168913/
State : failure

== Summary ==

CI Bug Log - changes from xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded_FULL -> xe-pw-168913v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168913v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168913v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168913v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][1] -> [TIMEOUT][2] +8 other tests timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [TIMEOUT][3] +4 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-bmg:          [PASS][4] -> [CRASH][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-1x1:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] +9 other tests incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-1x1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-1x1.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          [PASS][8] -> [SKIP][9] +64 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][10] +14 other tests incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:
    - shard-bmg:          NOTRUN -> [FAIL][11] +4 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap-eocheck:
    - shard-bmg:          [PASS][12] -> [FAIL][13] +7 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap-eocheck.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][14] +163 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:
    - shard-lnl:          [PASS][15] -> [TIMEOUT][16] +1 other test timeout
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][17] +11 other tests incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-nomemset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [TIMEOUT][18]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          NOTRUN -> [CRASH][19]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  
#### Warnings ####

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats:
    - shard-bmg:          [INCOMPLETE][20] -> [TIMEOUT][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [TIMEOUT][22] -> [SKIP][23] +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][24] ([Intel XE#1124]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][26] ([Intel XE#5643]) -> [TIMEOUT][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [CRASH][28] -> [INCOMPLETE][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][30] ([Intel XE#7679]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][32] ([Intel XE#7679]) -> [INCOMPLETE][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][34] ([Intel XE#367]) -> [INCOMPLETE][35] +1 other test incomplete
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][36] ([Intel XE#3432]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][38] ([Intel XE#2887]) -> [SKIP][39] +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-bmg:          [SKIP][40] ([Intel XE#2252]) -> [SKIP][41] +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][42] ([Intel XE#6974]) -> [SKIP][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          [FAIL][44] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_content_protection@legacy-hdcp14.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          [SKIP][46] ([Intel XE#2320]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x85.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][48] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][50] ([Intel XE#4141]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][52] ([Intel XE#2311]) -> [SKIP][53] +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-render.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][54] ([Intel XE#8368]) -> [TIMEOUT][55] +2 other tests timeout
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [INCOMPLETE][56] ([Intel XE#8368]) -> [SKIP][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-render.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][58] ([Intel XE#7061]) -> [SKIP][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][60] ([Intel XE#2313]) -> [SKIP][61] +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-bmg:          [SKIP][62] ([Intel XE#2763] / [Intel XE#6886]) -> [INCOMPLETE][63] +1 other test incomplete
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][64] ([Intel XE#2763] / [Intel XE#6886]) -> [TIMEOUT][65] +1 other test timeout
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][66] ([Intel XE#1489]) -> [SKIP][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][68] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][70] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_psr@psr-basic.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_psr@psr-basic.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          [SKIP][72] ([Intel XE#6503]) -> [SKIP][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_sharpness_filter@filter-tap.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_sharpness_filter@filter-tap.html

  * igt@xe_ccs@block-copy-uncompressed:
    - shard-bmg:          [SKIP][74] -> [INCOMPLETE][75] +1 other test incomplete
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_ccs@block-copy-uncompressed.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][76] ([Intel XE#7636]) -> [SKIP][77] +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          [SKIP][78] ([Intel XE#2322] / [Intel XE#7372]) -> [INCOMPLETE][79] +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          [SKIP][80] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][81] +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem:
    - shard-bmg:          [SKIP][82] ([Intel XE#8364]) -> [SKIP][83] +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-bmg:          [SKIP][84] -> [FAIL][85] +1 other test fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontunmap-eocheck.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-bmg:          [INCOMPLETE][86] ([Intel XE#8159]) -> [SKIP][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          [SKIP][88] ([Intel XE#8378]) -> [SKIP][89] +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          [INCOMPLETE][90] -> [CRASH][91] +1 other test crash
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  
Known issues
------------

  Here are the changes found in xe-pw-168913v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2134])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@fbdev@write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][93] -> [FAIL][94] ([Intel XE#3718] / [Intel XE#6078])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [PASS][95] -> [FAIL][96] ([Intel XE#6078])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2327]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][98] ([Intel XE#5643]) +1 other test incomplete
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][99] ([Intel XE#5643])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2328] / [Intel XE#7367])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1124]) +13 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#367])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2887])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#3432]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2887]) +11 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#7358]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2252]) +7 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][109] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +4 other tests fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][110] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#7642])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2390] / [Intel XE#6974])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][113] ([Intel XE#6707] / [Intel XE#7439])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2321] / [Intel XE#7355])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2320]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#309] / [Intel XE#7343])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][117] -> [INCOMPLETE][118] ([Intel XE#8151])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2286] / [Intel XE#6035])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#8265]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#4422] / [Intel XE#7442])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2374] / [Intel XE#6127])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2374] / [Intel XE#6128])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][124] -> [INCOMPLETE][125] ([Intel XE#8155]) +3 other tests incomplete
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][126] ([Intel XE#8155])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#301])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#7178] / [Intel XE#7349])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#7179])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#7905]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#7061])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#6312])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2311]) +55 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#656] / [Intel XE#7905]) +6 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#4141]) +20 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#6312] / [Intel XE#651])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#7399])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#7865]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2352] / [Intel XE#7399])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][143] ([Intel XE#8368])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2313]) +58 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#7061]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#4090] / [Intel XE#7443])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#8348])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][148] ([Intel XE#1035])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][149] ([Intel XE#1035])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#7283]) +6 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#8076])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#5021] / [Intel XE#7377])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2763] / [Intel XE#6886]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#7794])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2499])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#4608] / [Intel XE#7304])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#1489]) +9 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1128] / [Intel XE#7413])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#1406])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][163] -> [SKIP][164] ([Intel XE#8361])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2330] / [Intel XE#5813])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#3904] / [Intel XE#7342])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2413])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#6503]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2168] / [Intel XE#7444])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#1499]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#6599])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_compute@eu-busy-10s.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_create@create-big-vram.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#7636]) +11 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#6540] / [Intel XE#688])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-3/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][176] ([Intel XE#6321] / [Intel XE#8355]) +1 other test incomplete
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-virtual-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#7482])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_balancer@once-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2322] / [Intel XE#7372]) +8 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#1392])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#8374]) +13 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-userptr-fault:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#8374])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_fault_mode@once-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#8364]) +32 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#8364]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#8369]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][185] ([Intel XE#7928] / [Intel XE#8159])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][186] ([Intel XE#8159]) +26 other tests incomplete
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc:
    - shard-bmg:          [PASS][187] -> [INCOMPLETE][188] ([Intel XE#8159]) +16 other tests incomplete
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#8378]) +9 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#6281] / [Intel XE#7426])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-3/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214]) -> ([PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [SKIP][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239]) ([Intel XE#2457] / [Intel XE#7405])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-7/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-9/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-7/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-9/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-2/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#6964]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  * igt@xe_non_msix@walker-interrupt-notification-non-msix:
    - shard-bmg:          NOTRUN -> [SKIP][241] ([Intel XE#7622])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_non_msix@walker-interrupt-notification-non-msix.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#7793]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#2236] / [Intel XE#7590])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@pt-caching-update-pat-and-pte:
    - shard-bmg:          [PASS][244] -> [ABORT][245] ([Intel XE#7893] / [Intel XE#8300])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-9/igt@xe_pat@pt-caching-update-pat-and-pte.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_pat@pt-caching-update-pat-and-pte.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][246] ([Intel XE#7590])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][247] ([Intel XE#2284] / [Intel XE#7370])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][248] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][249] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#944]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_vfio@bind-unbind-vfs:
    - shard-lnl:          NOTRUN -> [SKIP][251] ([Intel XE#7724])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_sriov_vfio@bind-unbind-vfs.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][252] ([Intel XE#5545])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [TIMEOUT][253] -> [PASS][254] +4 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [INCOMPLETE][255] ([Intel XE#5643]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][257] ([Intel XE#8151]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][259] ([Intel XE#3321]) -> [PASS][260] +1 other test pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode:
    - shard-lnl:          [INCOMPLETE][261] -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][263] ([Intel XE#8368]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-bmg:          [INCOMPLETE][265] -> [PASS][266] +12 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-bmg:          [CRASH][267] -> [PASS][268] +1 other test pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][269] -> [PASS][270] +165 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock:
    - shard-bmg:          [FAIL][271] -> [PASS][272] +3 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:
    - shard-bmg:          [INCOMPLETE][273] ([Intel XE#8159]) -> [PASS][274] +8 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][275] ([Intel XE#2370]) -> [INCOMPLETE][276] ([Intel XE#8174])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
    - shard-bmg:          [SKIP][277] -> [INCOMPLETE][278] ([Intel XE#8174])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][279] -> [SKIP][280] ([Intel XE#2327]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [TIMEOUT][281] -> [INCOMPLETE][282] ([Intel XE#5643]) +1 other test incomplete
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [TIMEOUT][283] -> [INCOMPLETE][284] ([Intel XE#5643])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [SKIP][285] ([Intel XE#1124]) -> [INCOMPLETE][286] ([Intel XE#5643])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][287] -> [SKIP][288] ([Intel XE#1124]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [INCOMPLETE][289] ([Intel XE#5643]) -> [SKIP][290] ([Intel XE#1124]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          [INCOMPLETE][291] -> [SKIP][292] ([Intel XE#7679])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [CRASH][293] -> [SKIP][294] ([Intel XE#7679])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][295] -> [SKIP][296] ([Intel XE#367])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          [SKIP][297] -> [SKIP][298] ([Intel XE#2887]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][299] -> [SKIP][300] ([Intel XE#3432])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          [SKIP][301] -> [SKIP][302] ([Intel XE#7358]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          [SKIP][303] -> [SKIP][304] ([Intel XE#2252]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [SKIP][305] -> [FAIL][306] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_content_protection@suspend-resume.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][307] -> [FAIL][308] ([Intel XE#6707] / [Intel XE#7439])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_content_protection@uevent.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][309] -> [SKIP][310] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x170.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][311] ([Intel XE#7935]) -> [INCOMPLETE][312] ([Intel XE#7935] / [Intel XE#8151])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][313] -> [INCOMPLETE][314] ([Intel XE#8151])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][315] -> [SKIP][316] ([Intel XE#4354] / [Intel XE#5882])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-bmg:          [INCOMPLETE][317] ([Intel XE#8276]) -> [SKIP][318] ([Intel XE#8265]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][319] -> [SKIP][320] ([Intel XE#4422] / [Intel XE#7442])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][321] -> [SKIP][322] ([Intel XE#4156] / [Intel XE#7425])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [INCOMPLETE][323] -> [SKIP][324] ([Intel XE#7178] / [Intel XE#7351])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          [SKIP][325] -> [SKIP][326] ([Intel XE#7178] / [Intel XE#7351])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][327] -> [SKIP][328] ([Intel XE#4141]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][329] -> [SKIP][330] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][331] -> [SKIP][332] ([Intel XE#2311]) +16 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][333] ([Intel XE#2311]) -> [INCOMPLETE][334] ([Intel XE#8368]) +1 other test incomplete
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [TIMEOUT][335] -> [INCOMPLETE][336] ([Intel XE#8368])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][337] ([Intel XE#8368]) -> [SKIP][338] ([Intel XE#2313])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][339] -> [SKIP][340] ([Intel XE#7061]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][341] -> [SKIP][342] ([Intel XE#2313]) +16 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-bmg:          [TIMEOUT][343] -> [SKIP][344] ([Intel XE#7283])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][345] ([Intel XE#1035]) -> [SKIP][346] ([Intel XE#7283])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][347] -> [SKIP][348] ([Intel XE#7283]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [INCOMPLETE][349] -> [SKIP][350] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][351] -> [SKIP][352] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][353] -> [SKIP][354] ([Intel XE#1489]) +3 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [INCOMPLETE][355] -> [SKIP][356] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][357] -> [SKIP][358] ([Intel XE#4608])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-bmg:          [SKIP][359] -> [SKIP][360] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_psr@fbc-psr2-primary-render.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][361] -> [SKIP][362] ([Intel XE#6503])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][363] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][364] ([Intel XE#2426] / [Intel XE#5848])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          [SKIP][365] -> [SKIP][366] ([Intel XE#7636]) +3 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          [SKIP][367] -> [SKIP][368] ([Intel XE#8370])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_evict@evict-small-external-multi-queue.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_evict@evict-small-external-multi-queue.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][369] -> [SKIP][370] ([Intel XE#8374]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][371] -> [SKIP][372] ([Intel XE#8364]) +8 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          [SKIP][373] -> [SKIP][374] ([Intel XE#8369])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_exec_reset@multi-queue-close-execqueues.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
    - shard-bmg:          [INCOMPLETE][375] ([Intel XE#8366]) -> [SKIP][376] ([Intel XE#8378])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
    - shard-bmg:          [CRASH][377] -> [SKIP][378] ([Intel XE#8378])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [SKIP][379] ([Intel XE#8378]) -> [INCOMPLETE][380] ([Intel XE#8366])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          [SKIP][381] -> [SKIP][382] ([Intel XE#8378]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-rebind.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][383] -> [SKIP][384] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_media_fill@media-fill.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_media_fill@media-fill.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-bmg:          [SKIP][385] -> [SKIP][386] ([Intel XE#7793])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_page_reclaim@binds-large-split.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][387] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][388] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_peer2peer@write.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][389] -> [SKIP][390] ([Intel XE#2284] / [Intel XE#7370])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7928]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8276]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8276
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366
  [Intel XE#8368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded -> xe-pw-168913v2

  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded: 90ab81f3633e7adc7ea9d2ef905093f10b32cded
  xe-pw-168913v2: 168913v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/index.html

--===============0478645404810883456==
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
<tr><td><b>Series:</b></td><td>drm/xe/vm: Fix BO prefetch with CONSULT_MEM_=
ADVISE_PREF_LOC (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/168913/">https://patchwork.freedesktop.org/series/168913/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168913v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168913v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5297-90ab81f3633e7adc7ea9d2ef905093f10=
b32cded_FULL -&gt; xe-pw-168913v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168913v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-168913v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1689=
13v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">TIMEOUT</a> +8=
 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">TIMEOUT</a> +4=
 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_plan=
e@pixel-format-4-tiled-modifier-source-clamping.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/i=
gt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">CRASH</a><=
/li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-com=
pfmt0-system-system-1x1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_ccs@b=
lock-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-sy=
stem-1x1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_ccs@block-copy-uncompressed-inc-d=
imension@linear-uncompressed-compfmt0-system-system-1x1.html">INCOMPLETE</a=
> +9 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_=
balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-=
7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP=
</a> +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalida=
te:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@xe_exec_basic@many-execqueue=
s-many-vm-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> +14 other t=
ests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-malloc-race.html">FAIL</a> +4 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-dontunmap-eoc=
heck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@xe_exec_=
system_allocator@process-many-large-mmap-remap-dontunmap-eocheck.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16891=
3v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-mmap-remap-=
dontunmap-eocheck.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_system_allocator@thre=
ads-many-execqueues-mmap.html">SKIP</a> +163 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-6/igt@xe_exec_=
system_allocator@threads-many-execqueues-mmap-new-madvise.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/sha=
rd-lnl-7/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madv=
ise.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-free-nomemset.html">INCOMPLETE</a> +11 o=
ther tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_threads@threads-bal-m=
ixed-fd-userptr-invalidate-race.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@xe_fault_injection@inject-fa=
ult-probe-function-xe_sriov_init.html">CRASH</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_asyn=
c_flips@basic-modeset-with-all-modifiers-formats.html">INCOMPLETE</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-=
bmg-6/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats.html">TI=
MEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2=
/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-as=
ync-flip.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms=
_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">I=
ntel XE#5643</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168913v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-ro=
tate-0-hflip-async-flip.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-1-displays-target-2560x1440p.html">CRASH</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bm=
g-5/igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p.html">I=
NCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1689=
13v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x=
1080p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1689=
13v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x=
2160p.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_bw@l=
inear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-b=
mg-5/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">INCOMPLETE=
</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/sha=
rd-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_ccs@=
missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-b=
mg-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_cham=
elium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-=
7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_cont=
ent_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-b=
mg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_cont=
ent_protection@legacy-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE=
#7374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168913v2/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14.html">SKIP</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_curs=
or_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms=
_cursor_crc@cursor-random-256x85.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Int=
el XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7349">Intel XE#7349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp=
-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-rende=
r:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scnds=
crn-pri-shrfb-draw-render.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">=
Intel XE#8368</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168913v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndsc=
rn-pri-indfb-draw-mmap-wc.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-render.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">I=
ntel XE#8368</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscr=
n-pri-indfb-draw-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1689=
13v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-re=
nder.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168913v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-=
20x20-downscale-factor-0-5@pipe-a.html">INCOMPLETE</a> +1 other test incomp=
lete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel X=
E#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-5.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_psr2=
_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-b=
mg-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/ig=
t@kms_psr2_su@page_flip-nv12.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_psr@=
psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_psr=
@psr-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_shar=
pness_filter@filter-tap.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_sha=
rpness_filter@filter-tap.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_ccs@=
block-copy-uncompressed.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_ccs@block-copy-unc=
ompressed.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_eudeb=
ug_online@stopped-thread.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_eud=
ebug_online@stopped-thread.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2=
322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
72">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueue=
s-many-vm-null-defer-mmap.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel=
 XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-168913v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-rebind.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_=
multi_queue@two-queues-preempt-mode-priority-smem.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1689=
13v2/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-s=
mem.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_exec=
_system_allocator@process-many-large-mmap-shared-remap-dontunmap-eocheck.ht=
ml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168913v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-mma=
p-shared-remap-dontunmap-eocheck.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8159">Intel XE#8159</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_exec_system_allocator@thr=
eads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_=
threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard=
-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a>=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_ads_init.html">INCOMPLETE</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/=
shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_i=
nit.html">CRASH</a> +1 other test crash</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168913v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@fbdev@write.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel X=
E#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel =
XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bm=
g-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/60=
78">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>) +1 o=
ther test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +13 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_bw@linear-tiling-1-displa=
ys-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_chamelium_color_pipeline@=
plane-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_content_protection@atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +4 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_content_protection@atomi=
c-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 oth=
er test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/sh=
ard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8151">Intel XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_dsc@dsc-with-output-forma=
ts-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8265">Intel XE#8265</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Int=
el XE#8155</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_flip@flip-vs-absolute-wf_=
vblank-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE=
#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-nv12=
-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
hdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
hdr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
hdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-slowdraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
hdr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +6 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +20 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbch=
dr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-blt:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-scndscrn-spr-indfb-draw-blt.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +58 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psrh=
dr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_mst@mst-suspend-read-crc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-cc-modifier-source-clamping.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-modifier.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_plane@pixel-format-y-tile=
d-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_plane@planar-pixel-format=
-settings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_plane_multiple@2x-tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel=
 XE#6886</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">I=
ntel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304"=
>Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_psr@fbc-pr-primary-page-f=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-8/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-lnl-7/igt@k=
ms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361">Intel XE#8361=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_sharpness_filter@invalid-=
plane-with-filter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-d=
rrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_compute@eu-busy-10s.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
99">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_create@create-big-vram.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1062">Intel XE#1062</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7318">Intel XE#7318</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_eudebug_online@set-breakpo=
int-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7636">Intel XE#7636</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-3/igt@xe_evict@evict-cm-threads-sma=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_evict@evict-mixed-many-thr=
eads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) +1 other test i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_balancer@once-virtual=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +13 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-userptr-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_fault_mode@once-multi=
-queue-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +32 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat=
-error-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro=
-dontunmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-mmap-remap-ro-dontunmap.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928">Intel XE#=
7928</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-malloc-nomemset.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel X=
E#8159</a>) +26 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-=
malloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@xe_exec_=
system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
913v2/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-shared-al=
loc-many-stride-malloc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) +16 other tests i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_fault_injection@exec-queue=
-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-3/igt@xe_mmap@pci-membarrier.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
00">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32=
cded/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f1=
0b32cded/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef9050=
93f10b32cded/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef=
905093f10b32cded/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9=
d2ef905093f10b32cded/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc=
7ea9d2ef905093f10b32cded/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e=
7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3=
633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab=
81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-=
90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-9/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg=
-1/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-168913v2/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168913v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168913v2/shard-bmg-10/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v=
2/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168913v2/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v=
2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168913v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v=
2/shard-bmg-9/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-5/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168913v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v=
2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#740=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-o=
p-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_non_msix@walker-interrupt-notification-non-msix:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-9/igt@xe_non_msix@walker-interrupt-=
notification-non-msix.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7622">Intel XE#7622</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7793">Intel XE#7793</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pt-caching-update-pat-and-pte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-9/igt@xe_pat@p=
t-caching-update-pat-and-pte.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_pat@pt-cachin=
g-update-pat-and-pte.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7893">Intel XE#7893</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-7/igt@xe_pat@xa-app-transient-media=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/igt@xe_pxp@pxp-optout.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">I=
ntel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-8/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@bind-unbind-vfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-lnl-8/igt@xe_sriov_vfio@bind-unbind-vfs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7724">Intel XE#7724</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168913v2/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">TIMEOUT</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-6/=
igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> +4=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_big_=
fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">In=
tel XE#5643</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168913v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rota=
te-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-7/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">In=
tel XE#8151</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168913v2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-tra=
nsitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard=
-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-3/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode=
.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-168913v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-=
to-16bpp-linear-upscaling@pipe-a-default-mode.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">=
Intel XE#8368</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168913v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primsc=
rn-cur-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">IN=
COMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168913v2/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-with-clipping-cl=
amping-pixel-formats@pipe-a.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@xe_evict=
_ccs@evict-overcommit-parallel-instantfree-samefd.html">CRASH</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-=
4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_=
basic@many-bindexecqueue-rebind.html">SKIP</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_exec_basic=
@many-bindexecqueue-rebind.html">PASS</a> +165 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-mlock:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_=
system_allocator@process-many-large-execqueues-mmap-mlock.html">FAIL</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/sha=
rd-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-ml=
ock.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-no=
memset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_exec=
_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8159">Intel XE#8159</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_exec_system_allocator@threads=
-shared-vm-many-execqueues-malloc-nomemset.html">PASS</a> +8 other tests pa=
ss</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168913v2/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8174">Intel XE#8174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_ato=
mic_transition@plane-use-after-nonblocking-unbind-fencing.html">SKIP</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/sha=
rd-bmg-4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fenci=
ng.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8174">Intel XE#8174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_big_fb@4-tiled=
-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">TIMEOUT</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard=
-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5643">Intel XE#5643</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-2/igt@kms_big_=
fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">TIMEOUT</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-l=
nl-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-3/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
913v2/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-asy=
nc-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_big=
_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_big_fb@yf-tile=
d-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-8/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel=
 XE#5643</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-168913v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-2160x1440p.html">INCOMPLETE</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/sha=
rd-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">CRASH</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bm=
g-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/767=
9">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_bw@=
linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@km=
s_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_ccs=
@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_ccs@bad-aux-=
stride-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_cc=
s@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_cham=
elium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_ch=
amelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_cha=
melium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_chame=
lium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_cont=
ent_protection@suspend-resume.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_content_pro=
tection@suspend-resume.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_con=
tent_protection@uevent.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_content_protection=
@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_cur=
sor_crc@cursor-random-512x170.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_cursor_crc@=
cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_cur=
sor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">In=
tel XE#7935</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168913v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-t=
ransitions-varying-size.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">TIMEOUT</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2=
/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-vary=
ing-size.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8151">Intel XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_dp_link_trainin=
g@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_dsc@=
dsc-with-output-formats-with-bpc-ultrajoiner.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8276">Intel XE#8276=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1689=
13v2/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_fbc=
_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/ig=
t@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4=
422</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/74=
42">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-168913v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">INCOMPLETE</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v=
2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-up=
scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2=
/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-d=
ownscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-=
bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#=
7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-b=
mg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2311">Intel XE#2311</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168913v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scnds=
crn-cur-indfb-draw-render.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">TIMEOUT</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/=
shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-=
render.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8368">Intel XE#8368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836=
8">Intel XE#8368</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-168913v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p=
-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-2/i=
gt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel =
XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shar=
d-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-8/igt@kms_plan=
e@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">TIMEOUT</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/i=
gt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#=
7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_plan=
e@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel =
XE#1035</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168913v2/shard-bmg-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-so=
urce-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_pla=
ne@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4=
/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Int=
el XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">INCOMPLETE=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16891=
3v2/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale=
-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@kms_pm_rpm@modeset-lps=
p-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard=
-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-3/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">INCOMPLETE<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913=
v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed=
-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-lnl-3/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html=
">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168913v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-cont=
inuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_psr=
@fbc-psr2-primary-render.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_psr@fbc-psr2-pri=
mary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@kms_sha=
rpness_filter@invalid-filter-with-plane.html">SKIP</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@kms_s=
harpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shar=
d-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_eude=
bug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/i=
gt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel X=
E#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_evic=
t@evict-small-external-multi-queue.html">SKIP</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_evict@e=
vict-small-external-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-pr=
efetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
913v2/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userpt=
r-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_=
multi_queue@many-queues-preempt-mode-userptr-invalidate.html">SKIP</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard=
-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_exec=
_reset@multi-queue-close-execqueues.html">SKIP</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_exec_r=
eset@multi-queue-close-execqueues.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-9/igt@xe_exec_=
threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366=
">Intel XE#8366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mix=
ed-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalida=
te-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_exec_=
threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html">C=
RASH</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
68913v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm=
-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-5/igt@xe_exec_=
threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel =
XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168913v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shar=
ed-vm-userptr-rebind.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-10/igt@xe_exec=
_threads@threads-multi-queue-rebind.html">SKIP</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-4/igt@xe_exec_t=
hreads@threads-multi-queue-rebind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_media=
_fill@media-fill.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_media_fill@media-fill.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2596">Intel XE#2596</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_page_=
reclaim@binds-large-split.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_page_reclaim@bin=
ds-large-split.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_peer2=
peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/shard-bm=
g-1/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7=
326</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
53">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/shard-bmg-2/igt@xe_pm@d3=
cold-mmap-vram.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168913v2/shard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded -&gt; xe-pw-168=
913v2</li>
</ul>
<p>IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded: 90ab81f3633e7adc7ea9d2e=
f905093f10b32cded<br />
  xe-pw-168913v2: 168913v2</p>

</body>
</html>

--===============0478645404810883456==--
