Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763F2C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 00:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD4D10E839;
	Fri,  9 Aug 2024 00:53:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FB710E839;
 Fri,  9 Aug 2024 00:53:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4449817495169508492=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Rename_enable=5Fdispl?=
 =?utf-8?q?ay_module_param?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 00:53:15 -0000
Message-ID: <172316479517.550585.15210461329527369293@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808180154.2495634-1-lucas.demarchi@intel.com>
In-Reply-To: <20240808180154.2495634-1-lucas.demarchi@intel.com>
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

--===============4449817495169508492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rename enable_display module param
URL   : https://patchwork.freedesktop.org/series/137060/
State : failure

== Summary ==

CI Bug Log - changes from xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961_full -> xe-pw-137060v1_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-137060v1_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137060v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137060v1_full:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_compute_mode@many-preempt-fence-early:
    - shard-dg2-set2:     [INCOMPLETE][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_exec_compute_mode@many-preempt-fence-early.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@xe_exec_compute_mode@many-preempt-fence-early.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_color@ctm-0-25:
    - {shard-bmg}:        [DMESG-WARN][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-3/igt@kms_color@ctm-0-25.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-5/igt@kms_color@ctm-0-25.html

  * igt@kms_color@ctm-0-25@pipe-a-dp-2:
    - {shard-bmg}:        [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-3/igt@kms_color@ctm-0-25@pipe-a-dp-2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-5/igt@kms_color@ctm-0-25@pipe-a-dp-2.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
    - {shard-bmg}:        [PASS][7] -> [DMESG-WARN][8] +2 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_panel_fitting@atomic-fastset:
    - {shard-bmg}:        NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - {shard-bmg}:        [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][12] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-3/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-137060v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2-set2:     [PASS][13] -> [FAIL][14] ([Intel XE#827]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#1033])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#1659])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][20] ([Intel XE#324]) +2 other tests dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#316])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][22] ([Intel XE#1204])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124] / [Intel XE#1201])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#308])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1195]) +1 other test incomplete
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#309])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#599])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#1901] / [Intel XE#2028]) +3 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-6/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][40] -> [FAIL][41] ([Intel XE#1874]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#651])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [PASS][47] -> [DMESG-FAIL][48] ([Intel XE#324]) +2 other tests dmesg-fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-8/igt@kms_plane@plane-position-hole.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#324]) +3 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#836])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#929])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#327])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_sequence@get-busy:
    - shard-adlp:         [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1195]) +1 other test incomplete
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-1/igt@kms_sequence@get-busy.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-9/igt@kms_sequence@get-busy.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][60] -> [FAIL][61] ([Intel XE#899])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#2028]) +7 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-6/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#2443]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#756])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][67] -> [TIMEOUT][68] ([Intel XE#1473] / [Intel XE#402])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#288])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#2360])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#2229])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#2207]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][76] ([Intel XE#1551] / [Intel XE#569])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][77] -> [ABORT][78] ([Intel XE#1358] / [Intel XE#1607])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-7/igt@xe_pm@s4-basic.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][79] -> [ABORT][80] ([Intel XE#1794])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#944])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#944])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_vm@large-misaligned-binds-2147483648:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][83] ([Intel XE#1195]) +1 other test incomplete
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@xe_vm@large-misaligned-binds-2147483648.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [DMESG-WARN][84] ([Intel XE#1033]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][86] ([Intel XE#1426]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][88] ([Intel XE#1426]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - {shard-bmg}:        [FAIL][90] ([Intel XE#1659]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3:
    - {shard-bmg}:        [FAIL][92] ([Intel XE#2436]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][94] -> [PASS][95] +3 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - {shard-bmg}:        [DMESG-WARN][96] ([Intel XE#877]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [INCOMPLETE][98] ([Intel XE#1195]) -> [PASS][99] +2 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-436/igt@kms_flip@2x-flip-vs-modeset.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][100] ([Intel XE#886]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - {shard-bmg}:        [INCOMPLETE][102] -> [PASS][103] +3 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][104] ([Intel XE#1874]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][106] ([Intel XE#324]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][108] ([Intel XE#324]) -> [PASS][109] +3 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][110] ([Intel XE#616]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-435/igt@kms_plane_cursor@viewport.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [INCOMPLETE][112] -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][114] ([Intel XE#1430]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [FAIL][116] ([Intel XE#2028]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-4/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_sequence@queue-busy:
    - shard-lnl:          [FAIL][118] ([Intel XE#2467]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-7/igt@kms_sequence@queue-busy.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@kms_sequence@queue-busy.html

  * igt@kms_sequence@queue-busy@pipe-a-edp-1:
    - shard-lnl:          [FAIL][120] -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-7/igt@kms_sequence@queue-busy@pipe-a-edp-1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@kms_sequence@queue-busy@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][122] ([Intel XE#899]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][124] ([Intel XE#899]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][126] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][128] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@xe_evict@evict-threads-large.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][130] ([Intel XE#1794]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [TIMEOUT][132] -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-8/igt@xe_pm_residency@idle-residency-on-exec.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@xe_pm_residency@idle-residency-on-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][134] -> [DMESG-WARN][135] ([Intel XE#1033])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][137] ([Intel XE#316]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#316]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][140] ([Intel XE#324]) -> [FAIL][141] ([Intel XE#1204])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][143] ([Intel XE#619])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][144] ([Intel XE#1231]) -> [DMESG-FAIL][145] ([Intel XE#324])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1124]) -> [SKIP][147] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#607]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#607])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][151] ([Intel XE#1124]) +10 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][153] ([Intel XE#367])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#367]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][157] ([Intel XE#2191]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#787]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][163] ([Intel XE#787]) +76 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][165] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][167] ([Intel XE#314]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1152]) -> [SKIP][169] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][171] ([Intel XE#306])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#306]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][175] ([Intel XE#373]) +8 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#373]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#307]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#307])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][181] ([Intel XE#307])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#308]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#308])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#323]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#323])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#455]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][189] ([Intel XE#701])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1137]) -> [SKIP][191] ([Intel XE#1137] / [Intel XE#1201])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][193] ([Intel XE#1135])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_feature_discovery@psr1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1135]) -> [SKIP][195] ([Intel XE#1135] / [Intel XE#1201])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_feature_discovery@psr2.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][196] ([Intel XE#1551]) -> [INCOMPLETE][197] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][199] ([Intel XE#651]) +29 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#651]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#653]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#653]) +18 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][205] ([Intel XE#653]) +30 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][207] ([Intel XE#417])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][209] ([Intel XE#455]) +13 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][211] ([Intel XE#356])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][213] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][215] ([Intel XE#498]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][217] ([Intel XE#2318]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][219] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#2318]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#870]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#870])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][227] ([Intel XE#870])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_pm_backlight@fade.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][229] ([Intel XE#1122]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][231] ([Intel XE#908])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1129]) -> [SKIP][233] ([Intel XE#1129] / [Intel XE#1201])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1489]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][237] ([Intel XE#1489]) +4 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#929]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][241] ([Intel XE#929]) +13 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#327]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][245] ([Intel XE#1127])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][247] ([Intel XE#327]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][249] ([Intel XE#1729])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][251] ([Intel XE#2168])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_vrr@cmrr.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][253] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][255] ([Intel XE#1126])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1126]) -> [SKIP][257] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][258] ([Intel XE#1195] / [Intel XE#1473]) -> [INCOMPLETE][259] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#288]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#288]) +17 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][263] ([Intel XE#288]) +24 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][265] ([Intel XE#512])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@xe_mmap@small-bar.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][267] ([Intel XE#378])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@xe_module_load@force-load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#378]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#378])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_module_load@load.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2207]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#2207]) +4 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#2207]) -> [SKIP][273] ([Intel XE#2207]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#977]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#977])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][277] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][279] ([Intel XE#579])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#944]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][283] ([Intel XE#944]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961 -> xe-pw-137060v1

  IGT_7962: 7962
  xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961: 6eced4bb82542c5f00a48e4d7b66a10905736961
  xe-pw-137060v1: 137060v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/index.html

--===============4449817495169508492==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rename enable_display module param</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137060/">https://patchwork.freedesktop.org/series/137060/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961_full -&gt; xe-pw-137060v1_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-137060v1_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137060v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137060v1_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_compute_mode@many-preempt-fence-early:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_exec_compute_mode@many-preempt-fence-early.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@xe_exec_compute_mode@many-preempt-fence-early.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-3/igt@kms_color@ctm-0-25.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-5/igt@kms_color@ctm-0-25.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-3/igt@kms_color@ctm-0-25@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-5/igt@kms_color@ctm-0-25@pipe-a-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-3/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137060v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-6/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-8/igt@kms_plane@plane-position-hole.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-1/igt@kms_sequence@get-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-9/igt@kms_sequence@get-busy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-6/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_evict@evict-beng-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-7/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@xe_vm@large-misaligned-binds-2147483648.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-436/igt@kms_flip@2x-flip-vs-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-435/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-4/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-7/igt@kms_sequence@queue-busy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467">Intel XE#2467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@kms_sequence@queue-busy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-7/igt@kms_sequence@queue-busy@pipe-a-edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@kms_sequence@queue-busy@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-5/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-lnl-8/igt@xe_pm_residency@idle-residency-on-exec.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-lnl-3/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-463/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-463/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-435/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961 -&gt; xe-pw-137060v1</li>
</ul>
<p>IGT_7962: 7962<br />
  xe-1736-6eced4bb82542c5f00a48e4d7b66a10905736961: 6eced4bb82542c5f00a48e4d7b66a10905736961<br />
  xe-pw-137060v1: 137060v1</p>

</body>
</html>

--===============4449817495169508492==--
