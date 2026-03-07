Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0E2FC9ECF
	for <intel-xe@archiver.kernel.org>; Sat,  7 Mar 2026 05:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429BB10E34B;
	Sat,  7 Mar 2026 05:17:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C0B10E345;
 Sat,  7 Mar 2026 05:17:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2220697414273152203=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc=3A_Fail_immedia?=
 =?utf-8?q?tely_on_GuC_load_error_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Mar 2026 05:17:30 -0000
Message-ID: <177286065004.329859.10778974790046470864@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303001732.2540493-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260303001732.2540493-2-daniele.ceraolospurio@intel.com>
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

--===============2220697414273152203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Fail immediately on GuC load error (rev4)
URL   : https://patchwork.freedesktop.org/series/161860/
State : failure

== Summary ==

CI Bug Log - changes from xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3_FULL -> xe-pw-161860v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161860v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161860v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161860v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in xe-pw-161860v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#7556]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#3432])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#3321])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#6693])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_pm_rpm@system-suspend-idle.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#2142]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#6703]) +88 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html

  * igt@xe_exec_system_allocator@many-stride-malloc-race:
    - shard-bmg:          [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#5213] / [Intel XE#6652])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-malloc-race.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-race.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#5625])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_vm@bind-array-many:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#6557] / [Intel XE#6703])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_vm@bind-array-many.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_vm@bind-array-many.html

  
#### Possible fixes ####

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][20] ([Intel XE#7340]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][22] ([Intel XE#6361]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-8/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-5/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][24] ([Intel XE#6321]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][26] ([Intel XE#1124]) -> [SKIP][27] ([Intel XE#6703])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [SKIP][28] ([Intel XE#367] / [Intel XE#7354]) -> [SKIP][29] ([Intel XE#6703])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][30] ([Intel XE#2887]) -> [SKIP][31] ([Intel XE#6703]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][32] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][33] ([Intel XE#6703])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][34] ([Intel XE#2320]) -> [SKIP][35] ([Intel XE#6703])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][36] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][37] ([Intel XE#6703])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][38] ([Intel XE#6126] / [Intel XE#776]) -> [SKIP][39] ([Intel XE#6703])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_fbcon_fbt@psr.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][40] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][41] ([Intel XE#6703])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][42] ([Intel XE#4141]) -> [SKIP][43] ([Intel XE#6703]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][44] ([Intel XE#2311]) -> [SKIP][45] ([Intel XE#6703]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][46] ([Intel XE#2313]) -> [SKIP][47] ([Intel XE#6703]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][48] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][49] ([Intel XE#6703])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][50] ([Intel XE#6901]) -> [SKIP][51] ([Intel XE#6703])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-bmg:          [SKIP][52] ([Intel XE#7283]) -> [SKIP][53] ([Intel XE#6703])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][54] ([Intel XE#3309] / [Intel XE#7368]) -> [SKIP][55] ([Intel XE#6703])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_pm_dc@dc5-retention-flops.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][56] ([Intel XE#1489]) -> [SKIP][57] ([Intel XE#6703]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][58] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][59] ([Intel XE#6703])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_psr2_su@page_flip-nv12.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-bmg:          [SKIP][60] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][61] ([Intel XE#6703]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_psr@psr2-sprite-plane-onoff.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][62] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][63] ([Intel XE#6703])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][64] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][65] ([Intel XE#2426] / [Intel XE#5848])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          [SKIP][66] ([Intel XE#4837]) -> [SKIP][67] ([Intel XE#6703])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_eudebug@basic-vm-access.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-bmg:          [SKIP][68] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][69] ([Intel XE#6703])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_eudebug_online@reset-with-attention.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_exec_fault_mode@many-multi-queue-imm:
    - shard-bmg:          [SKIP][70] ([Intel XE#7136]) -> [SKIP][71] ([Intel XE#6703]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-imm.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-imm.html

  * igt@xe_exec_multi_queue@many-execs-dyn-priority-smem:
    - shard-bmg:          [SKIP][72] ([Intel XE#6874]) -> [SKIP][73] ([Intel XE#6703]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-dyn-priority-smem.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-dyn-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:
    - shard-bmg:          [SKIP][74] ([Intel XE#7138]) -> [SKIP][75] ([Intel XE#6703])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][76] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][77] ([Intel XE#6703])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7556]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7556
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776


Build changes
-------------

  * Linux: xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3 -> xe-pw-161860v4

  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3: 6707287bc6e4620c3bde4f316248cc8e7a4a95d3
  xe-pw-161860v4: 161860v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/index.html

--===============2220697414273152203==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Fail immediately on GuC load error (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161860/">https://patchwork.freedesktop.org/series/161860/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3_FULL -&gt; xe-pw-161860v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161860v4_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161860v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161860v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@flip-vs-cursor-atomic:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161860v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7556">Intel XE#7556</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-malloc-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-race.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_vm@bind-array-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_vm@bind-array-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-8/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-5/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126">Intel XE#6126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161860v4/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3 -&gt; xe-pw-161860v4</li>
</ul>
<p>IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4672-6707287bc6e4620c3bde4f316248cc8e7a4a95d3: 6707287bc6e4620c3bde4f316248cc8e7a4a95d3<br />
  xe-pw-161860v4: 161860v4</p>

</body>
</html>

--===============2220697414273152203==--
