Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B5FCCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 18:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8389E10E222;
	Fri, 24 Oct 2025 18:59:38 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC1410E1FA;
 Fri, 24 Oct 2025 18:59:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7219213390294284639=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Use_display_parent_interfa?=
 =?utf-8?q?ce_for_runtime_pm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 18:59:37 -0000
Message-ID: <176133237797.53484.8799824025385914528@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024093113.1119070-1-jouni.hogander@intel.com>
In-Reply-To: <20251024093113.1119070-1-jouni.hogander@intel.com>
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

--===============7219213390294284639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use display parent interface for runtime pm (rev2)
URL   : https://patchwork.freedesktop.org/series/156308/
State : failure

== Summary ==

CI Bug Log - changes from xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7_FULL -> xe-pw-156308v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156308v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156308v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156308v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-156308v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#623])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#455]) +7 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#316]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#607])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#607])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#367]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#3442]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#787]) +41 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][13] -> [INCOMPLETE][14] ([Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#306]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#373]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2320])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2291]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#323])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#776])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2316])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2316]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][29] -> [FAIL][30] ([Intel XE#301] / [Intel XE#3149])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     [PASS][31] -> [FAIL][32] ([Intel XE#301] / [Intel XE#3149] / [Intel XE#3321])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][33] -> [DMESG-WARN][34] ([Intel XE#4543] / [Intel XE#5208])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][35] -> [DMESG-WARN][36] ([Intel XE#4543]) +3 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][37] -> [DMESG-FAIL][38] ([Intel XE#4543])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2312])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [PASS][40] -> [DMESG-WARN][41] ([Intel XE#2953] / [Intel XE#4173]) +6 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#651]) +15 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#6312]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2313])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#653]) +16 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#1503])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-4/igt@kms_hdr@static-swap.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#5020])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2763]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#870])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-adlp:         [PASS][52] -> [DMESG-WARN][53] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5750])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-1/igt@kms_pm_rpm@universal-planes.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-9/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#3414])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1435])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1091] / [Intel XE#2849])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#6360])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_copy_basic@mem-set-linear-0x8fffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#5503])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x8fffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1126])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#4837]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#288]) +13 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_system_allocator@process-many-mmap-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#4915]) +182 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_exec_system_allocator@process-many-mmap-huge.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#6281])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#5893])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#560])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92]) -> ([PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [SKIP][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117]) ([Intel XE#378])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-464/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-464/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-436/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-463/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-466/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-466/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-434/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-432/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-432/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-432/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-434/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-436/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-433/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-433/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-436/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-433/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-464/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-463/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-463/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-432/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-466/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-463/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-463/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-463/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-466/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-466/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-466/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-435/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-435/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-435/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#3573]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pm@d3hot-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#5742])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#5742])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][121] -> [DMESG-WARN][122] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][123] ([Intel XE#6406])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_pm@s4-mocs.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#4733]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#944]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#4814])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#4130])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#4273])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vram@vf-access-after-resize-down:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#6318])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_sriov_vram@vf-access-after-resize-down.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][130] ([Intel XE#3884]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-3/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][132] ([Intel XE#4543]) -> [PASS][133] +22 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][136] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][138] ([Intel XE#2291]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][140] ([Intel XE#2316]) -> [PASS][141] +9 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][142] ([Intel XE#4543]) -> [PASS][143] +34 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][144] ([Intel XE#5338] / [Intel XE#5416]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-adlp:         [DMESG-WARN][146] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-8/igt@kms_flip@flip-vs-panning-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-6/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
    - shard-adlp:         [TIMEOUT][148] ([Intel XE#4543]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-1/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][150] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][152] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][153] +3 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         [DMESG-WARN][154] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][155] +2 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][156] ([Intel XE#1503]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [DMESG-WARN][158] ([Intel XE#3868]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-9/igt@xe_exec_reset@cm-close-fd.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [DMESG-FAIL][160] ([Intel XE#4543]) -> [DMESG-WARN][161] ([Intel XE#2953] / [Intel XE#4173])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][162] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][163] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][164] ([Intel XE#2341]) -> [FAIL][165] ([Intel XE#1178])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_content_protection@atomic.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][166] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][167] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][168] ([Intel XE#2312]) -> [SKIP][169] ([Intel XE#2311]) +11 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][170] ([Intel XE#2311]) -> [SKIP][171] ([Intel XE#2312]) +8 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][172] ([Intel XE#2312]) -> [SKIP][173] ([Intel XE#5390]) +4 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][174] ([Intel XE#5390]) -> [SKIP][175] ([Intel XE#2312]) +7 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][176] ([Intel XE#2313]) -> [SKIP][177] ([Intel XE#2312]) +10 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][178] ([Intel XE#2312]) -> [SKIP][179] ([Intel XE#2313]) +9 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][180] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][181] ([Intel XE#3544])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][182] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][183] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5750
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6406
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7 -> xe-pw-156308v2

  IGT_8596: 8596
  xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7: 413d17c6dcb8f50d17083bd1b15258f97282cdd7
  xe-pw-156308v2: 156308v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/index.html

--===============7219213390294284639==
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
<tr><td><b>Series:</b></td><td>Use display parent interface for runtime pm =
(rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/156308/">https://patchwork.freedesktop.org/series/156308/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-156308v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-156308v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3979-413d17c6dcb8f50d17083bd1b15258f97=
282cdd7_FULL -&gt; xe-pw-156308v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156308v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-156308v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1563=
08v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_basic@multigpu-once-basic:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-once-basic.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_exec_basic@m=
ultigpu-once-basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156308v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-t=
iled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_atomic_transition@plane=
-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@kms_bw@linear-tiling-4-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg=
2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_chamelium_hpd@vga-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-4/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-8/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@kms_flip@flip-vs-=
expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank@d-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@kms_flip@fl=
ip-vs-expired-vblank@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#332=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-2/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-9/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-2/igt@kms_fli=
p@flip-vs-rmfb-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-9/igt@kms_f=
lip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
 +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp=
-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-1/igt@kms_frontbuffe=
r_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +6 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-4/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@kms_pm_backlight@fade.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
70">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-1/igt@kms_pm_=
rpm@universal-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-9/igt@kms_pm_rpm@universal-pl=
anes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5750">Intel XE#5750</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@kms_rotation_crc@primary-ro=
tation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@sriov_basic@enable-vfs-auto=
probe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_compute_preempt@compute-=
preempt-many-all-ram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6360">Intel XE#6360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x8fffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linea=
r-0x8fffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5503">Intel XE#5503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linea=
r-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-fa=
ultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-in=
valid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_exec_system_allocator@pr=
ocess-many-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +182 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_fault_injection@exec-que=
ue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-4=
34/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-464/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard=
-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f972=
82cdd7/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b152=
58f97282cdd7/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083=
bd1b15258f97282cdd7/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50=
d17083bd1b15258f97282cdd7/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6d=
cb8f50d17083bd1b15258f97282cdd7/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413=
d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-39=
79-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-434/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282=
cdd7/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1b15258=
f97282cdd7/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17083bd1=
b15258f97282cdd7/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8f50d17=
083bd1b15258f97282cdd7/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17c6dcb8=
f50d17083bd1b15258f97282cdd7/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-413d17=
c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3979-=
413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@xe_module_load@l=
oad.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-156308v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg=
2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-156308v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v=
2/shard-dg2-433/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-433/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-156308v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-463/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-156308v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-463/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-156308v2/shard-dg2-463/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1563=
08v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-156308v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shar=
d-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-466/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-156308v2/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-435/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156=
308v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">In=
tel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@xe_oa@whitelisted-registers=
-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_pm@d3hot-i2c.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">I=
ntel XE#5742</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-bmg-6/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-2/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-2/igt@xe_pm@s2idle-vm-bin=
d-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_pm@s4-mocs.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6406">Int=
el XE#6406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_pxp@display-black-pxp-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_query@multigpu-query-mem=
-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-464/igt@xe_render_copy@render-stres=
s-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-434/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-432/igt@xe_sriov_flr@flr-vfs-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-down:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-156308v2/shard-dg2-436/igt@xe_sriov_vram@vf-access-aft=
er-resize-down.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6318">Intel XE#6318</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-3/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-=
4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-156308v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-156308v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2=
705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-156308v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2=
-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-7/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg=
-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +9 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-9/igt@kms_fli=
p@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp=
-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> +34 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-4/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416">Intel XE#=
5416</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
156308v2/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-8/igt@kms_fli=
p@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1563=
08v2/shard-adlp-6/igt@kms_flip@flip-vs-panning-interruptible.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-4/igt@kms_fli=
p@flip-vs-panning-vs-hang@d-hdmi-a1.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-ad=
lp-1/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-156308v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-8/igt@kms_flip_s=
caled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.htm=
l">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel =
XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-156308v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-indfb-draw-blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-4/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-3/igt@xe_exec=
_reset@cm-close-fd.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-9/igt@xe_ex=
ec_reset@cm-close-fd.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-1/igt@kms_big=
_fb@x-tiled-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-adlp-9/i=
gt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#=
4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-156308v2/shard-dg2-466/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-4/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-156308v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1563=
08v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
156308v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
56308v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
156308v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
56308v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1563=
08v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-4/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156308v2/shard-bmg-5/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7/shard-bmg-8/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Inte=
l XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-156308v2/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7 -&gt; xe-pw-156=
308v2</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3979-413d17c6dcb8f50d17083bd1b15258f97282cdd7: 413d17c6dcb8f50d17083bd=
1b15258f97282cdd7<br />
  xe-pw-156308v2: 156308v2</p>

</body>
</html>

--===============7219213390294284639==--
