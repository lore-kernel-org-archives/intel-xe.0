Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13919FA3748
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 12:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D275E10ECFD;
	Fri, 13 Sep 2024 12:01:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE9610ECFD;
 Fri, 13 Sep 2024 12:01:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4962229698849361078=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Fix_xe=5Fforce=5Fwake=5Fget=28?=
 =?utf-8?q?=29_failure_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 12:01:48 -0000
Message-ID: <172622890870.996331.3297490730993597140@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

--===============4962229698849361078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix xe_force_wake_get() failure handling (rev2)
URL   : https://patchwork.freedesktop.org/series/137982/
State : failure

== Summary ==

CI Bug Log - changes from xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc_full -> xe-pw-137982v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137982v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137982v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137982v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_debugfs@gt:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-433/igt@xe_debugfs@gt.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-436/igt@xe_debugfs@gt.html
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-4/igt@xe_debugfs@gt.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-3/igt@xe_debugfs@gt.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-2/igt@xe_exec_reset@gt-reset-stress.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_display_modes@extended-mode-basic:
    - {shard-bmg}:        [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@xe_drm_fdinfo@basic-mem:
    - {shard-bmg}:        [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-4/igt@xe_drm_fdinfo@basic-mem.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-7/igt@xe_drm_fdinfo@basic-mem.html

  
Known issues
------------

  Here are the changes found in xe-pw-137982v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#1659]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#607])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#346])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#306])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#307])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#308])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#323])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#877]) +1 other test dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-lnl:          [PASS][28] -> [DMESG-WARN][29] ([Intel XE#877]) +1 other test dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1195] / [Intel XE#2049])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#1195])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#656]) +18 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#651]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#656])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#1201] / [Intel XE#455])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][42] -> [DMESG-FAIL][43] ([Intel XE#324]) +1 other test dmesg-fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_plane@plane-position-covered.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [PASS][44] -> [DMESG-WARN][45] ([Intel XE#324])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][46] ([Intel XE#1874]) +3 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1149] / [Intel XE#1201])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#327])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][52] -> [FAIL][53] ([Intel XE#771] / [Intel XE#899])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][54] -> [FAIL][55] ([Intel XE#899])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1123] / [Intel XE#1201])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@xe_evict@evict-beng-mixed-threads-large.html
    - shard-dg2-set2:     [PASS][58] -> [TIMEOUT][59] ([Intel XE#1473])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate-race:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#1069])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr-imm.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][65] ([Intel XE#1962])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][66] ([Intel XE#1999]) +2 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@enable-disable:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@xe_oa@enable-disable.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#2723])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@xe_oa@oa-exponents.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-7/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][70] ([Intel XE#2723])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-7/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][73] ([Intel XE#324]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear:
    - shard-lnl:          [FAIL][75] ([Intel XE#911]) -> [PASS][76] +2 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][77] ([Intel XE#877]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][79] ([Intel XE#877]) -> [PASS][80] +6 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [FAIL][83] ([Intel XE#886]) -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-3/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][85] ([Intel XE#1874]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][87] ([Intel XE#2622]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-WARN][89] ([Intel XE#324]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@kms_plane@plane-position-hole.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-1/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][91] ([Intel XE#361]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [FAIL][93] ([Intel XE#899]) -> [PASS][94] +3 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [FAIL][95] ([Intel XE#1000]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][97] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        [TIMEOUT][99] ([Intel XE#1473]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [FAIL][101] ([Intel XE#1000]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-1/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][103] ([Intel XE#1473]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_oa@oa-exponents:
    - {shard-bmg}:        [FAIL][105] ([Intel XE#2723]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-2/igt@xe_oa@oa-exponents.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-2/igt@xe_oa@oa-exponents.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][107] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][109] ([Intel XE#2019]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#801]) -> [SKIP][112] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#316]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][116] ([Intel XE#316]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][117] ([Intel XE#324]) -> [FAIL][118] ([Intel XE#1231]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#610]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#610])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1124]) -> [SKIP][122] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][123] ([Intel XE#1231]) -> [DMESG-FAIL][124] ([Intel XE#324]) +1 other test dmesg-fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][126] ([Intel XE#1124]) +9 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][128] ([Intel XE#607])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][130] ([Intel XE#346])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_big_joiner@basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_big_joiner@basic.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][132] ([Intel XE#367]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#367]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#2191]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#2191])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][138] ([Intel XE#2191])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][140] ([Intel XE#1252]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#787]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#787]) +83 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][146] ([Intel XE#787]) +76 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][148] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][150] ([Intel XE#306]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_chamelium_color@degamma.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#306]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_chamelium_color@gamma.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#373]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][156] ([Intel XE#373]) +7 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][158] ([Intel XE#307])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#308]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#308])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#323]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#323])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][164] ([Intel XE#776])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_fbcon_fbt@psr.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][166] ([Intel XE#701])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][168] ([Intel XE#455]) +17 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#455]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][171] ([i915#5274]) -> [SKIP][172] ([Intel XE#1201] / [i915#5274])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][174] ([Intel XE#651]) +29 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#651]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][178] ([Intel XE#658])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#653]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#658]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#658])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][184] ([Intel XE#653]) +30 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#356]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#356])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][188] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][190] ([Intel XE#498]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2318]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#870]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#870])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#908]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#908])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1489]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][202] ([Intel XE#1489]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][204] ([Intel XE#1122])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1122]) -> [SKIP][206] ([Intel XE#1122] / [Intel XE#1201])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][208] ([Intel XE#929]) +13 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#929]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][212] ([Intel XE#1149]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][214] ([Intel XE#327])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#327]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1127]) -> [SKIP][218] ([Intel XE#1127] / [Intel XE#1201])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][220] ([Intel XE#1729])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#1500])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2168]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#2168])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_vrr@cmrr.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][226] ([Intel XE#2168])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_vrr@lobf.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][228] ([Intel XE#756])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][230] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1123]) -> [SKIP][232] ([Intel XE#1123] / [Intel XE#1201])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1126]) -> [SKIP][234] ([Intel XE#1126] / [Intel XE#1201])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][236] ([Intel XE#288]) +24 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#288]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2360]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#2360])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][242] ([Intel XE#560])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_media_fill@media-fill.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#378]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#378])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_module_load@force-load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][246] ([Intel XE#2541]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2541]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_oa@rc6-disable.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1337]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#1337])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][252] ([Intel XE#977])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][254] ([Intel XE#2284] / [Intel XE#366])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#944]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][258] ([Intel XE#944]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_query@multigpu-query-engines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc -> xe-pw-137982v2

  IGT_8015: 8015
  xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc: 9fd27ed0883cff53777b8db0b7c6db327132dcdc
  xe-pw-137982v2: 137982v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/index.html

--===============4962229698849361078==
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
<tr><td><b>Series:</b></td><td>Fix xe_force_wake_get() failure handling (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137982/">https://patchwork.freedesktop.org/series/137982/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc_full -&gt; xe-pw-137982v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137982v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137982v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137982v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_debugfs@gt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-433/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-436/igt@xe_debugfs@gt.html">DMESG-WARN</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-4/igt@xe_debugfs@gt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-3/igt@xe_debugfs@gt.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-2/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@basic-mem:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-4/igt@xe_drm_fdinfo@basic-mem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-7/igt@xe_drm_fdinfo@basic-mem.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137982v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-6/igt@xe_oa@enable-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@xe_oa@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-7/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-7/igt@xe_oa@oa-exponents@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-3/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-lnl-1/igt@kms_plane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-1/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-2/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-bmg-2/igt@xe_oa@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-466/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v2/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc -&gt; xe-pw-137982v2</li>
</ul>
<p>IGT_8015: 8015<br />
  xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc: 9fd27ed0883cff53777b8db0b7c6db327132dcdc<br />
  xe-pw-137982v2: 137982v2</p>

</body>
</html>

--===============4962229698849361078==--
