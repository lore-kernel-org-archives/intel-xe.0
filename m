Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16F2F8A167
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 12:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9636D10E892;
	Thu, 16 Apr 2026 12:01:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD1210E892;
 Thu, 16 Apr 2026 12:01:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2980331199278238811=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Add_support_for_?=
 =?utf-8?q?GPU_health_indicator?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 12:01:54 -0000
Message-ID: <177634091488.468738.17357300267302060574@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416093610.4085667-1-soham.purkait@intel.com>
In-Reply-To: <20260416093610.4085667-1-soham.purkait@intel.com>
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

--===============2980331199278238811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add support for GPU health indicator
URL   : https://patchwork.freedesktop.org/series/164989/
State : failure

== Summary ==

CI Bug Log - changes from xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28_FULL -> xe-pw-164989v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-164989v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-164989v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-164989v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@fbdev@unaligned-read.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@fbdev@unaligned-read.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-6/igt@kms_big_fb@x-tiled-addfb.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@kms_big_fb@x-tiled-addfb.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-bmg:          [PASS][5] -> [TIMEOUT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_gt_freq@freq_reset_multiple.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_gt_freq@freq_reset_multiple.html

  
Known issues
------------

  Here are the changes found in xe-pw-164989v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_edge_walk@128x128-top-edge@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][7] ([Intel XE#7725])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-top-edge@pipe-d-hdmi-a-3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [PASS][8] -> [DMESG-WARN][9] ([Intel XE#5208])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-bmg:          [PASS][10] -> [ABORT][11] ([Intel XE#5545] / [Intel XE#6652]) +1 other test abort
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-9/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#301]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][14] ([Intel XE#2597]) +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#6703]) +142 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html

  * igt@xe_exec_system_allocator@many-stride-free:
    - shard-bmg:          [PASS][17] -> [DMESG-WARN][18] ([Intel XE#7725]) +4 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-free.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-free.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][19] -> [DMESG-WARN][20] ([Intel XE#6627] / [Intel XE#7419] / [Intel XE#7725])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-6/igt@xe_survivability@runtime-survivability.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@fbdev@pan:
    - shard-bmg:          [FAIL][21] ([Intel XE#2488]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-3/igt@fbdev@pan.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-4/igt@fbdev@pan.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-bmg:          [FAIL][23] -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][25] ([Intel XE#6361]) -> [PASS][26] +2 other tests pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_setmode@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-7/igt@kms_setmode@basic.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:
    - shard-lnl:          [FAIL][27] -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][29] ([Intel XE#2327]) -> [SKIP][30] ([Intel XE#6703]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][31] ([Intel XE#1124]) -> [SKIP][32] ([Intel XE#6703]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][33] ([Intel XE#7679]) -> [SKIP][34] ([Intel XE#6703])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][35] ([Intel XE#2887]) -> [SKIP][36] ([Intel XE#6703]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          [SKIP][37] ([Intel XE#2252]) -> [SKIP][38] ([Intel XE#6703]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][39] ([Intel XE#6974]) -> [SKIP][40] ([Intel XE#6703])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][41] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][42] ([Intel XE#6703])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_content_protection@uevent-hdcp14.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-bmg:          [SKIP][43] ([Intel XE#2320]) -> [SKIP][44] ([Intel XE#6703])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x42.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][45] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][46] ([Intel XE#6703])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][47] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][48] ([Intel XE#6703])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][49] ([Intel XE#2311]) -> [SKIP][50] ([Intel XE#2312])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][51] ([Intel XE#4141]) -> [SKIP][52] ([Intel XE#6703]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][53] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][54] ([Intel XE#6703])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][55] ([Intel XE#2311]) -> [SKIP][56] ([Intel XE#6703]) +6 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][57] ([Intel XE#2313]) -> [SKIP][58] ([Intel XE#6703]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [SKIP][59] ([Intel XE#7283]) -> [SKIP][60] ([Intel XE#6703])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][61] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][62] ([Intel XE#6703])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][63] ([Intel XE#3309] / [Intel XE#7368]) -> [SKIP][64] ([Intel XE#6703])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][65] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [SKIP][66] ([Intel XE#6703])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][67] ([Intel XE#1489]) -> [SKIP][68] ([Intel XE#6703]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][69] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][70] ([Intel XE#6703]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][71] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][72] ([Intel XE#6703])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][73] ([Intel XE#1499]) -> [SKIP][74] ([Intel XE#6703])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_vrr@max-min.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][75] ([Intel XE#7636]) -> [SKIP][76] ([Intel XE#6703]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_evict@evict-mixed-threads-small-multi-queue:
    - shard-bmg:          [SKIP][77] ([Intel XE#7140]) -> [SKIP][78] ([Intel XE#6703])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_evict@evict-mixed-threads-small-multi-queue.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_evict@evict-mixed-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][79] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][80] ([Intel XE#6703]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:
    - shard-bmg:          [SKIP][81] ([Intel XE#7136]) -> [SKIP][82] ([Intel XE#6703]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@many-queues-dyn-priority-smem:
    - shard-bmg:          [SKIP][83] ([Intel XE#6874]) -> [SKIP][84] ([Intel XE#6703]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-dyn-priority-smem.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-dyn-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          [SKIP][85] ([Intel XE#7138]) -> [SKIP][86] ([Intel XE#6703]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          [SKIP][87] ([Intel XE#944]) -> [SKIP][88] ([Intel XE#6703])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_query@multigpu-query-engines.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_query@multigpu-query-engines.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2488
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28 -> xe-pw-164989v1

  IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28: 7e772296e93b337ca5e12fced2ac12716a159d28
  xe-pw-164989v1: 164989v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/index.html

--===============2980331199278238811==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add support for GPU health indicator</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164989/">https://patchwork.freedesktop.org/series/164989/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28_FULL -&gt; xe-pw-164989v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-164989v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-164989v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-164989v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@fbdev@unaligned-read.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-6/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@kms_big_fb@x-tiled-addfb.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_gt_freq@freq_reset_multiple.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164989v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-top-edge@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-9/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +142 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-free:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-free.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-6/igt@xe_survivability@runtime-survivability.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-3/igt@fbdev@pan.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2488">Intel XE#2488</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-4/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-7/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_evict@evict-mixed-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_evict@evict-mixed-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28/shard-bmg-2/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164989v1/shard-bmg-2/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28 -&gt; xe-pw-164989v1</li>
</ul>
<p>IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4911-7e772296e93b337ca5e12fced2ac12716a159d28: 7e772296e93b337ca5e12fced2ac12716a159d28<br />
  xe-pw-164989v1: 164989v1</p>

</body>
</html>

--===============2980331199278238811==--
