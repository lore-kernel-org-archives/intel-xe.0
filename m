Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F01CAC5A7
	for <intel-xe@archiver.kernel.org>; Sun, 21 Sep 2025 01:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B537210E2F2;
	Sun, 21 Sep 2025 01:06:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E501510E132;
 Sun, 21 Sep 2025 01:06:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4119768618727915337=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_mei=3A_late=5Fbind=3A_Fix_?=
 =?utf-8?q?-Wincompatible-function-pointer-types-strict?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 21 Sep 2025 01:06:42 -0000
Message-ID: <175841680276.351222.5583529167641098822@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250920-drm-xe-fix-wifpts-v1-1-c89b5357c7ba@kernel.org>
In-Reply-To: <20250920-drm-xe-fix-wifpts-v1-1-c89b5357c7ba@kernel.org>
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

--===============4119768618727915337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: mei: late_bind: Fix -Wincompatible-function-pointer-types-strict
URL   : https://patchwork.freedesktop.org/series/154808/
State : failure

== Summary ==

CI Bug Log - changes from xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142_FULL -> xe-pw-154808v1_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-154808v1_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154808v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154808v1_FULL:

### IGT changes ###

#### Warnings ####

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][1] ([Intel XE#4543]) -> [TIMEOUT][2] +1 other test timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-8/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-2/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-adlp:         [DMESG-FAIL][3] ([Intel XE#5213]) -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@xe_sriov_scheduling@equal-throughput.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-3/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise}:
    - shard-bmg:          [PASS][5] -> [CRASH][6] +17 other tests crash
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise.html

  * {igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise}:
    - shard-lnl:          [WARN][7] ([Intel XE#5786]) -> [CRASH][8] +2 other tests crash
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-2/igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-lnl-5/igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise.html

  * {igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:
    - shard-lnl:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * {igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared}:
    - shard-lnl:          [PASS][11] -> [CRASH][12] +6 other tests crash
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-8/igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared.html

  
Known issues
------------

  Here are the changes found in xe-pw-154808v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#316]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#2191])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +118 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#4417]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#306])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#373]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2252])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#1178])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][24] ([Intel XE#1188])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2291]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#4494])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1138])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][29] -> [INCOMPLETE][30] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2316]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [PASS][33] -> [DMESG-WARN][34] ([Intel XE#4543]) +11 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][35] -> [DMESG-FAIL][36] ([Intel XE#4543])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][37] -> [FAIL][38] ([Intel XE#1874])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#651]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2313])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#653]) +8 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#1503])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_hdr@static-toggle.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2927])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_lease@implicit-plane-lease:
    - shard-adlp:         [PASS][45] -> [DMESG-WARN][46] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_lease@implicit-plane-lease.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-1/igt@kms_lease@implicit-plane-lease.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#5020])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#870])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#2939])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#3414])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#2883]) +2 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#455]) +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [FAIL][56] ([Intel XE#5890]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1123])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#4837]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1392])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#1392]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#288]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#4915]) +102 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#3573]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1061])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2284] / [Intel XE#366])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_pm@d3cold-basic.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#4733]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#944])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][69] ([Intel XE#4543]) -> [PASS][70] +8 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][71] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][73] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][75] ([Intel XE#2291]) -> [PASS][76] +3 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][77] ([Intel XE#4633]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-bmg:          [DMESG-WARN][79] ([Intel XE#5354]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_cursor_legacy@single-bo.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-3/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][81] ([Intel XE#4302]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][83] ([Intel XE#4354]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][85] ([Intel XE#2316]) -> [PASS][86] +5 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][87] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][89] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][91] ([Intel XE#4543]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][93] ([Intel XE#1874]) -> [PASS][94] +2 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][95] ([Intel XE#2883]) -> [PASS][96] +5 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-434/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#1392]) -> [PASS][98] +4 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * {igt@xe_exec_system_allocator@many-64k-mmap-prefetch-shared}:
    - shard-bmg:          [CRASH][99] -> [PASS][100] +5 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@xe_exec_system_allocator@many-64k-mmap-prefetch-shared.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-prefetch-shared.html

  * {igt@xe_exec_system_allocator@many-64k-new-prefetch}:
    - shard-lnl:          [CRASH][101] -> [PASS][102] +5 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-new-prefetch.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-lnl-4/igt@xe_exec_system_allocator@many-64k-new-prefetch.html

  * igt@xe_pat@pat-index-xe2:
    - shard-bmg:          [FAIL][103] ([Intel XE#5507]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@xe_pat@pat-index-xe2.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-3/igt@xe_pat@pat-index-xe2.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][105] ([Intel XE#2341]) -> [FAIL][106] ([Intel XE#1178])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_content_protection@legacy.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][107] ([Intel XE#1178]) -> [SKIP][108] ([Intel XE#2341])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_content_protection@srm.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][109] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][110] ([Intel XE#2953] / [Intel XE#4173])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][111] ([Intel XE#2311]) -> [SKIP][112] ([Intel XE#2312]) +9 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][113] ([Intel XE#2312]) -> [SKIP][114] ([Intel XE#2311]) +14 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][115] ([Intel XE#5390]) -> [SKIP][116] ([Intel XE#2312]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][117] ([Intel XE#2312]) -> [SKIP][118] ([Intel XE#5390]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][119] ([Intel XE#2312]) -> [SKIP][120] ([Intel XE#2313]) +16 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][121] ([Intel XE#2313]) -> [SKIP][122] ([Intel XE#2312]) +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][123] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][124] ([Intel XE#3544])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][125] ([Intel XE#2426]) -> [FAIL][126] ([Intel XE#1729])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     [ABORT][127] ([Intel XE#5466]) -> [ABORT][128] ([Intel XE#4917] / [Intel XE#5466])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142 -> xe-pw-154808v1

  IGT_8546: 8546
  xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142: cfa128d879d8cdea4007ddd56dcc2eac73ff2142
  xe-pw-154808v1: 154808v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/index.html

--===============4119768618727915337==
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
<tr><td><b>Series:</b></td><td>mei: late_bind: Fix -Wincompatible-function-pointer-types-strict</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154808/">https://patchwork.freedesktop.org/series/154808/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142_FULL -&gt; xe-pw-154808v1_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-154808v1_FULL need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-154808v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-154808v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-8/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-2/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@xe_sriov_scheduling@equal-throughput.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-3/igt@xe_sriov_scheduling@equal-throughput.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise}:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@xe_exec_system_allocator@many-64k-malloc-prefetch-madvise.html">CRASH</a> +17 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-2/igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-lnl-5/igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise.html">CRASH</a> +2 other tests crash</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-8/igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared.html">CRASH</a> +6 other tests crash</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154808v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_content_protection@legacy@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@implicit-plane-lease:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-2/igt@kms_lease@implicit-plane-lease.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-1/igt@kms_lease@implicit-plane-lease.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890">Intel XE#5890</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +102 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-436/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@kms_cursor_legacy@single-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-3/igt@kms_cursor_legacy@single-bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-434/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-mmap-prefetch-shared}:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@xe_exec_system_allocator@many-64k-mmap-prefetch-shared.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-prefetch-shared.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-64k-new-prefetch}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-new-prefetch.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-lnl-4/igt@xe_exec_system_allocator@many-64k-new-prefetch.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-8/igt@xe_pat@pat-index-xe2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-3/igt@xe_pat@pat-index-xe2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-adlp-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154808v1/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142 -&gt; xe-pw-154808v1</li>
</ul>
<p>IGT_8546: 8546<br />
  xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142: cfa128d879d8cdea4007ddd56dcc2eac73ff2142<br />
  xe-pw-154808v1: 154808v1</p>

</body>
</html>

--===============4119768618727915337==--
