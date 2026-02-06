Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D18EE6B69
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 22:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2874510E945;
	Fri,  6 Feb 2026 22:05:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A1910E945;
 Fri,  6 Feb 2026 22:05:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4562699150664037940=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/uapi=3A_Update_xe?=
 =?utf-8?q?=5Fdrm=2Eh_documentation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Feb 2026 22:05:52 -0000
Message-ID: <177041555266.235359.2226018605982038830@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205200330.1509354-2-shuicheng.lin@intel.com>
In-Reply-To: <20260205200330.1509354-2-shuicheng.lin@intel.com>
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

--===============4562699150664037940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Update xe_drm.h documentation
URL   : https://patchwork.freedesktop.org/series/161217/
State : failure

== Summary ==

CI Bug Log - changes from xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3_FULL -> xe-pw-161217v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161217v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161217v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161217v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-bmg:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  
Known issues
------------

  Here are the changes found in xe-pw-161217v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#2314] / [Intel XE#2894])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][8] ([Intel XE#1178] / [Intel XE#3304])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2291]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2316]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][13] -> [INCOMPLETE][14] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2311]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2313]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7111] / [Intel XE#7130] / [Intel XE#7131])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7131])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7130]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7111] / [Intel XE#7131])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#1435])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4837])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][24] -> [INCOMPLETE][25] ([Intel XE#6321]) +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7136])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][27] ([Intel XE#2291]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][29] ([Intel XE#5299]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-render:
    - shard-bmg:          [INCOMPLETE][31] ([Intel XE#6819]) -> [PASS][32] +1 other test pass
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-3/igt@kms_draw_crc@draw-method-render.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_draw_crc@draw-method-render.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [SKIP][33] ([Intel XE#2316]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][35] ([Intel XE#7086]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][37] ([Intel XE#2571]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          [FAIL][39] ([Intel XE#3304]) -> [SKIP][40] ([Intel XE#7194])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-9/igt@kms_content_protection@legacy-hdcp14.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][41] ([Intel XE#2341]) -> [FAIL][42] ([Intel XE#1178] / [Intel XE#3304])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][43] ([Intel XE#2311]) -> [SKIP][44] ([Intel XE#2312]) +8 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][45] ([Intel XE#4141]) -> [SKIP][46] ([Intel XE#2312]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][47] ([Intel XE#2312]) -> [SKIP][48] ([Intel XE#4141]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][49] ([Intel XE#2312]) -> [SKIP][50] ([Intel XE#2311]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][51] ([Intel XE#2313]) -> [SKIP][52] ([Intel XE#2312]) +13 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][53] ([Intel XE#2312]) -> [SKIP][54] ([Intel XE#2313]) +6 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][55] ([Intel XE#5021]) -> [SKIP][56] ([Intel XE#4596])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3 -> xe-pw-161217v1

  IGT_8739: 8739
  xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3: af5dcbe7f59f0275168f750fc7c80160db3b6ab3
  xe-pw-161217v1: 161217v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/index.html

--===============4562699150664037940==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Update xe_drm.h documentation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161217/">https://patchwork.freedesktop.org/series/161217/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3_FULL -&gt; xe-pw-161217v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161217v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161217v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161217v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161217v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@xe_eudebug@discovery-race-vmbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-3/igt@kms_draw_crc@draw-method-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-2/igt@kms_draw_crc@draw-method-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-9/igt@kms_content_protection@legacy-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194">Intel XE#7194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161217v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3 -&gt; xe-pw-161217v1</li>
</ul>
<p>IGT_8739: 8739<br />
  xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3: af5dcbe7f59f0275168f750fc7c80160db3b6ab3<br />
  xe-pw-161217v1: 161217v1</p>

</body>
</html>

--===============4562699150664037940==--
