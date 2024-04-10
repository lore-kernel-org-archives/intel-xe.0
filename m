Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3BDCD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 18:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E80310ED57;
	Wed, 10 Apr 2024 18:31:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCF710ED57;
 Wed, 10 Apr 2024 18:31:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1087575770129146561=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm=3A_move_Intel_drm_headers_t?=
 =?utf-8?q?o_a_subdirectory_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 18:31:44 -0000
Message-ID: <171277390490.1338744.15351471517095837894@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712743191.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
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

--===============1087575770129146561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: move Intel drm headers to a subdirectory (rev2)
URL   : https://patchwork.freedesktop.org/series/132263/
State : failure

== Summary ==

CI Bug Log - changes from xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430_full -> xe-pw-132263v2_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-132263v2_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132263v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 9)
------------------------------

  Additional (6): shard-lnl-1 shard-lnl-2 shard-lnl-3 shard-lnl-4 shard-lnl-5 shard-lnl-8 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132263v2_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-edp-2} (NEW):
    - {shard-lnl-3}:      NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-edp-2.html

  * {igt@kms_psr@psr-dpms@edp-2} (NEW):
    - {shard-lnl-3}:      NOTRUN -> [DMESG-WARN][2] +3 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-3/igt@kms_psr@psr-dpms@edp-2.html

  * {igt@kms_psr@psr-primary-render@edp-2} (NEW):
    - {shard-lnl-5}:      NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-5/igt@kms_psr@psr-primary-render@edp-2.html

  
#### Warnings ####

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:
    - shard-adlp:         [INCOMPLETE][4] ([Intel XE#1195]) -> ([ABORT][5], [ABORT][6])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {shard-lnl-2}:      NOTRUN -> [DMESG-WARN][7] +2 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-lnl-3}:      NOTRUN -> [DMESG-FAIL][8] +1 other test dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - {shard-lnl-3}:      NOTRUN -> [INCOMPLETE][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-lnl-5}:      NOTRUN -> [DMESG-WARN][10] +5 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_sequence@queue-busy:
    - {shard-lnl-5}:      NOTRUN -> [SKIP][11] +47 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-5/igt@kms_sequence@queue-busy.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
    - {shard-lnl-2}:      NOTRUN -> [INCOMPLETE][12] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html

  * igt@xe_exec_basic@many-userptr:
    - {shard-lnl-5}:      NOTRUN -> [DMESG-FAIL][13] +1 other test dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-5/igt@xe_exec_basic@many-userptr.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate:
    - {shard-lnl-1}:      NOTRUN -> [DMESG-WARN][14] +1 other test dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-1/igt@xe_exec_threads@threads-fd-userptr-invalidate.html

  * igt@xe_pm@s4-basic:
    - {shard-lnl-4}:      NOTRUN -> [DMESG-FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-4/igt@xe_pm@s4-basic.html

  * igt@xe_prime_self_import@basic-llseek-size:
    - {shard-lnl-3}:      NOTRUN -> [DMESG-WARN][16] +15 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-lnl-3/igt@xe_prime_self_import@basic-llseek-size.html

  
New tests
---------

  New tests have been introduced between xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430_full and xe-pw-132263v2_full:

### New IGT tests (8) ###

  * igt@kms_flip@basic-plain-flip@a-edp2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [48.67] s

  * igt@kms_flip@basic-plain-flip@b-edp2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [47.62] s

  * igt@kms_flip@basic-plain-flip@c-edp2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [47.83] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-edp-2:
    - Statuses : 1 skip(s)
    - Exec time: [22.89] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-edp-2:
    - Statuses : 1 skip(s)
    - Exec time: [23.04] s

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-edp-2:
    - Statuses : 1 skip(s)
    - Exec time: [22.50] s

  * igt@kms_psr@psr-dpms@edp-2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [81.42] s

  * igt@kms_psr@psr-primary-render@edp-2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [79.30] s

  

Known issues
------------

  Here are the changes found in xe-pw-132263v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#316])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][19], [SKIP][20]) ([Intel XE#1124] / [Intel XE#1201])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#787]) +58 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][23], [SKIP][24]) ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +8 other tests ( 2 skip )
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#1201] / [Intel XE#787]) +28 other tests ( 2 skip )
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#306])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#373])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_chamelium_frames@dp-frame-dump.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#373])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> ([SKIP][32], [SKIP][33]) ([Intel XE#1201] / [Intel XE#373])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][34], [FAIL][35]) ([Intel XE#1178])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#455])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [PASS][37] -> ([DMESG-WARN][38], [DMESG-WARN][39]) ([Intel XE#1214] / [Intel XE#282])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][40] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [PASS][42] -> ([PASS][43], [DMESG-WARN][44]) ([Intel XE#1214] / [Intel XE#282]) +9 other tests ( 1 dmesg-warn, 1 pass )
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#310])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@basic-plain-flip@d-hdmi-a2:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][46] ([Intel XE#1214]) +16 other tests dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_flip@basic-plain-flip@d-hdmi-a2.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> ([INCOMPLETE][47], [DMESG-WARN][48]) ([Intel XE#1088] / [Intel XE#1195] / [Intel XE#1214] / [Intel XE#1330]) +1 other test ( 1 dmesg-warn, 1 incomplete )
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [FAIL][49] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][50] ([Intel XE#324] / [Intel XE#358]) +1 other test dmesg-fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#650]) +51 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1151] / [Intel XE#1201])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#1201] / [Intel XE#651]) +3 other tests ( 2 skip )
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#1201] / [Intel XE#653]) +1 other test ( 2 skip )
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-adlp:         NOTRUN -> ([SKIP][62], [SKIP][63]) ([Intel XE#1201] / [Intel XE#455])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_hdr@static-toggle-dpms.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][64], [FAIL][65]) ([Intel XE#616])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#1214])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][68] ([Intel XE#1214] / [i915#10142])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-FAIL][69], [DMESG-WARN][70]) ([Intel XE#1214] / [Intel XE#324])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][71] ([Intel XE#324])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][72], [SKIP][73]) ([Intel XE#1201] / [Intel XE#455])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][76], [INCOMPLETE][77]) ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) +1 other test ( 2 incomplete )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#870])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#870])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [PASS][80] -> ([PASS][81], [SKIP][82]) ([Intel XE#1201] / [Intel XE#1211])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@kms_pm_rpm@legacy-planes.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#1211])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][86], [SKIP][87]) ([Intel XE#1201] / [Intel XE#929])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_psr@fbc-psr2-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr@psr2-basic:
    - shard-adlp:         NOTRUN -> ([SKIP][89], [SKIP][90]) ([Intel XE#1201] / [Intel XE#929])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_psr@psr2-basic.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [FAIL][91] ([Intel XE#616])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#327])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#327])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][95] -> ([SKIP][96], [PASS][97]) ([Intel XE#1201] / [Intel XE#455])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-463/igt@kms_vrr@negative-basic.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][99] -> ([TIMEOUT][100], [TIMEOUT][101]) ([Intel XE#1041] / [Intel XE#1259] / [Intel XE#1473] / [Intel XE#392])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#261])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][103] -> ([TIMEOUT][104], [TIMEOUT][105]) ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_evict@evict-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][107] -> ([PASS][108], [TIMEOUT][109]) ([Intel XE#1473] / [Intel XE#392])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@xe_evict@evict-threads-large.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@xe_evict@evict-threads-large.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-dg2-set2:     [PASS][110] -> ([PASS][111], [TIMEOUT][112]) ([Intel XE#1259] / [Intel XE#1473])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@xe_evict@evict-threads-small-multi-vm.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_evict@evict-threads-small-multi-vm.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#688])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - shard-adlp:         NOTRUN -> [FAIL][114] ([Intel XE#1069])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][115], [SKIP][116]) ([Intel XE#1201] / [Intel XE#288]) +1 other test ( 2 skip )
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:
    - shard-adlp:         NOTRUN -> ([SKIP][117], [SKIP][118]) ([Intel XE#1201] / [Intel XE#288])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][121] ([Intel XE#1214] / [Intel XE#358])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_threads@threads-bal-fd-rebind:
    - shard-dg2-set2:     [PASS][122] -> ([PASS][123], [TIMEOUT][124]) ([Intel XE#1206] / [Intel XE#1356])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-rebind.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@xe_exec_threads@threads-bal-fd-rebind.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-rebind.html

  * igt@xe_exec_threads@threads-hang-fd-basic:
    - shard-dg2-set2:     [PASS][125] -> ([TIMEOUT][126], [PASS][127]) ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) +1 other test ( 1 pass, 1 timeout )
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-basic.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-basic.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][128] -> ([PASS][129], [SKIP][130]) ([Intel XE#1192] / [Intel XE#1201])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#378])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_module_load@force-load.html
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1201] / [Intel XE#378])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_module_load@force-load.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][133] -> ([PASS][134], [DMESG-WARN][135]) ([Intel XE#1214])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-434/igt@xe_module_load@unload.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_module_load@unload.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@xe_module_load@unload.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1201] / [Intel XE#366])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#366])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         NOTRUN -> ([INCOMPLETE][138], [INCOMPLETE][139]) ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][140], [SKIP][141]) ([Intel XE#1201] / [Intel XE#366])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [FAIL][142] ([Intel XE#1043] / [Intel XE#845])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_pm@s4-basic-exec.html
    - shard-adlp:         NOTRUN -> [FAIL][143] ([Intel XE#1043] / [Intel XE#845])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_vm@bind-flag-invalid:
    - shard-adlp:         NOTRUN -> [FAIL][144] ([Intel XE#1559])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_vm@bind-flag-invalid.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][145] ([Intel XE#1559])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_vm@bind-flag-invalid.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2-set2:     [FAIL][146] ([Intel XE#827]) -> ([PASS][147], [PASS][148]) +1 other test ( 2 pass )
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
    - shard-dg2-set2:     [DMESG-WARN][149] ([Intel XE#1214]) -> ([PASS][150], [PASS][151]) +1 other test ( 2 pass )
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html

  * {igt@kms_big_joiner@basic-force-joiner}:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201]) -> ([PASS][153], [PASS][154])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_big_joiner@basic-force-joiner.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_big_joiner@basic-force-joiner.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][155] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [DMESG-WARN][157] ([Intel XE#1214] / [Intel XE#282]) -> ([PASS][158], [PASS][159]) +1 other test ( 2 pass )
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][160] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> ([PASS][161], [PASS][162])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-bo@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][163] ([Intel XE#1214] / [Intel XE#877]) -> ([PASS][164], [PASS][165]) +1 other test ( 2 pass )
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-b.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-b.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-b.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][166] ([Intel XE#1214]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][168] ([Intel XE#771] / [Intel XE#899]) -> ([PASS][169], [PASS][170])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][171] ([Intel XE#899]) -> ([PASS][172], [PASS][173])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [TIMEOUT][174] ([Intel XE#1261] / [Intel XE#1356]) -> ([PASS][175], [PASS][176])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [TIMEOUT][177] ([Intel XE#1206] / [Intel XE#1356]) -> ([PASS][178], [PASS][179])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [ABORT][180] ([Intel XE#1216]) -> ([PASS][181], [PASS][182])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@xe_module_load@many-reload.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_module_load@many-reload.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [DMESG-WARN][183] ([Intel XE#1191] / [Intel XE#1214]) -> ([PASS][184], [PASS][185])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_pm@s3-multiple-execs.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [DMESG-FAIL][186] ([Intel XE#1538]) -> ([ABORT][187], [DMESG-FAIL][188]) ([Intel XE#1538])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-9/igt@core_hotunplug@hotreplug.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@core_hotunplug@hotreplug.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [ABORT][189] ([Intel XE#1538]) -> ([INCOMPLETE][190], [ABORT][191]) ([Intel XE#1195] / [Intel XE#1538])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][192] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358]) -> ([DMESG-WARN][193], [DMESG-WARN][194]) ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][195] ([Intel XE#1033] / [Intel XE#1214]) -> ([DMESG-WARN][196], [DMESG-WARN][197]) ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) +2 other tests ( 2 dmesg-warn )
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][198] ([Intel XE#324]) -> ([FAIL][199], [FAIL][200]) ([Intel XE#1231]) +2 other tests ( 2 fail )
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][201] ([Intel XE#1231]) -> ([FAIL][202], [DMESG-FAIL][203]) ([Intel XE#1231] / [Intel XE#324]) +1 other test ( 1 dmesg-fail, 1 fail )
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#455]) -> ([FAIL][205], [FAIL][206]) ([Intel XE#1178])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_content_protection@atomic.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_content_protection@atomic.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][207] ([Intel XE#1214] / [Intel XE#282]) -> ([PASS][208], [DMESG-WARN][209]) ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][210] ([Intel XE#1214] / [Intel XE#282]) -> ([DMESG-WARN][211], [PASS][212]) ([Intel XE#1214] / [Intel XE#282]) +1 other test ( 1 dmesg-warn, 1 pass )
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][213] ([Intel XE#1191] / [Intel XE#1214]) -> ([DMESG-WARN][214], [DMESG-WARN][215]) ([Intel XE#1191] / [Intel XE#1214] / [i915#10142])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201]) -> ([SKIP][217], [SKIP][218]) ([Intel XE#1201] / [Intel XE#1226]) +34 other tests ( 2 skip )
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#455]) -> ([SKIP][220], [PASS][221]) ([Intel XE#1201] / [Intel XE#455])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [INCOMPLETE][222] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927]) -> ([INCOMPLETE][223], [DMESG-WARN][224]) ([Intel XE#1035] / [Intel XE#1191] / [Intel XE#1195] / [Intel XE#1214] / [Intel XE#927])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-adlp:         [INCOMPLETE][225] ([Intel XE#1195] / [Intel XE#927]) -> ([DMESG-WARN][226], [INCOMPLETE][227]) ([Intel XE#1191] / [Intel XE#1195] / [Intel XE#1214] / [Intel XE#927])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [DMESG-FAIL][228] ([Intel XE#1162]) -> ([FAIL][229], [DMESG-FAIL][230]) ([Intel XE#1162] / [Intel XE#616]) +1 other test ( 1 dmesg-fail, 1 fail )
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [DMESG-WARN][231] ([Intel XE#1214] / [Intel XE#324]) -> ([DMESG-FAIL][232], [DMESG-WARN][233]) ([Intel XE#1214] / [Intel XE#324])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-463/igt@kms_plane_lowres@tiling-x.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][234] ([Intel XE#361]) -> ([FAIL][235], [PASS][236]) ([Intel XE#361])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-adlp:         [SKIP][237] ([Intel XE#1201] / [Intel XE#1211]) -> ([SKIP][238], [PASS][239]) ([Intel XE#1201] / [Intel XE#1211])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_pm_rpm@drm-resources-equal.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-4/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#1211]) -> ([PASS][241], [SKIP][242]) ([Intel XE#1201] / [Intel XE#1211])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_sequence@queue-busy:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#1234]) -> ([SKIP][244], [SKIP][245]) ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1234])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_sequence@queue-busy.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_sequence@queue-busy.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_sequence@queue-busy.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#869]) -> ([SKIP][247], [SKIP][248]) ([Intel XE#1201] / [Intel XE#362] / [Intel XE#869])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][249] ([Intel XE#1191] / [Intel XE#1214]) -> ([DMESG-WARN][250], [PASS][251]) ([Intel XE#1191] / [Intel XE#1214])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][252] ([Intel XE#1214] / [i915#10142]) -> ([DMESG-WARN][253], [DMESG-WARN][254]) ([Intel XE#1191] / [Intel XE#1214] / [i915#10142])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [DMESG-FAIL][255] ([Intel XE#821]) -> ([PASS][256], [DMESG-FAIL][257]) ([Intel XE#821])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [INCOMPLETE][258] ([Intel XE#1195] / [Intel XE#1473]) -> ([INCOMPLETE][259], [PASS][260]) ([Intel XE#1195] / [Intel XE#1473])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-466/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_exec_basic@many-execqueues-userptr:
    - shard-adlp:         [DMESG-WARN][261] ([Intel XE#1214]) -> ([PASS][262], [DMESG-WARN][263]) ([Intel XE#1214])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-1/igt@xe_exec_basic@many-execqueues-userptr.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-4/igt@xe_exec_basic@many-execqueues-userptr.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@xe_exec_basic@many-execqueues-userptr.html

  * igt@xe_exec_store@page-sized:
    - shard-dg2-set2:     [FAIL][264] ([Intel XE#1270]) -> ([FAIL][265], [PASS][266]) ([Intel XE#1270])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@xe_exec_store@page-sized.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@xe_exec_store@page-sized.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_exec_store@page-sized.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-rebind:
    - shard-dg2-set2:     [INCOMPLETE][267] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) -> ([PASS][268], [INCOMPLETE][269]) ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][270] ([Intel XE#1214] / [i915#10142]) -> [DMESG-WARN][271] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         [INCOMPLETE][272] ([Intel XE#1195] / [Intel XE#1358]) -> ([INCOMPLETE][273], [DMESG-WARN][274]) ([Intel XE#1191] / [Intel XE#1195] / [Intel XE#1214] / [Intel XE#1358])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-1/igt@xe_pm@s3-exec-after.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@xe_pm@s3-exec-after.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@xe_pm@s3-exec-after.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1216]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1270]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1270
  [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1415
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440
  [Intel XE#1444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1444
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1488
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1527
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/869
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#10142]: https://gitlab.freedesktop.org/drm/intel/issues/10142


Build changes
-------------

  * Linux: xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430 -> xe-pw-132263v2

  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430: 284b05a047b8b3bca4682e963d8e6d93493e8430
  xe-pw-132263v2: 132263v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/index.html

--===============1087575770129146561==
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
<tr><td><b>Series:</b></td><td>drm: move Intel drm headers to a subdirector=
y (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/132263/">https://patchwork.freedesktop.org/series/132263/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-132263v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-132263v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1067-284b05a047b8b3bca4682e963d8e6d934=
93e8430_full -&gt; xe-pw-132263v2_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-132263v2_full need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-132263v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 9)</h2>
<p>Additional (6): shard-lnl-1 shard-lnl-2 shard-lnl-3 shard-lnl-4 shard-ln=
l-5 shard-lnl-8 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1322=
63v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b=
-edp-2} (NEW):</p>
<ul>
<li>{shard-lnl-3}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-3/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-modifiers@pipe-b-edp-2.html">SKIP</a> +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr-dpms@edp-2} (NEW):</p>
<ul>
<li>{shard-lnl-3}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-3/igt@kms_psr@psr-dpms@edp-2.html">=
DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr-primary-render@edp-2} (NEW):</p>
<ul>
<li>{shard-lnl-5}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-5/igt@kms_psr@psr-primary-render@ed=
p-2.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-8/igt@xe_exec=
_balancer@many-execqueues-parallel-userptr-rebind.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#=
1195</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-132263v2/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-parallel-userpt=
r-rebind.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_exec_balancer@many-execqueues-parall=
el-userptr-rebind.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{shard-lnl-2}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-2/igt@core_hotunplug@unbind-rebind.=
html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-lnl-3}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> +1 other test dmesg-fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-lnl-3}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-pri-indfb-draw-mmap-wc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-lnl-5}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-5/igt@kms_hdr@invalid-hdr.html">DME=
SG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>{shard-lnl-5}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-5/igt@kms_sequence@queue-busy.html"=
>SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl-2}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-2/igt@kms_vblank@ts-continuation-dp=
ms-suspend@pipe-a-edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr:</p>
<ul>
<li>{shard-lnl-5}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-5/igt@xe_exec_basic@many-userptr.ht=
ml">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate:</p>
<ul>
<li>{shard-lnl-1}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-1/igt@xe_exec_threads@threads-fd-us=
erptr-invalidate.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>{shard-lnl-4}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-4/igt@xe_pm@s4-basic.html">DMESG-FA=
IL</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-llseek-size:</p>
<ul>
<li>{shard-lnl-3}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-lnl-3/igt@xe_prime_self_import@basic-ll=
seek-size.html">DMESG-WARN</a> +15 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1067-284b05a047b8b3bca4682e963=
d8e6d93493e8430_full and xe-pw-132263v2_full:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [48.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [47.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [47.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-=
edp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [22.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-=
edp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [23.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-=
edp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [22.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms@edp-2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [81.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render@edp-2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [79.30] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132263v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw=
-stride-32bpp-rotate-180-async-flip.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_big_fb@y=
f-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_ccs=
@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer=
-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_ccs=
@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787">Intel XE#787</a>) +28 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-y=
f-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_chamelium_color@ctm-max.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_chamelium_frames@dp-fram=
e-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_chamelium_frames@dp-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@kms_chamelium_hpd@vga-hpd-a=
fter-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-after-susp=
end.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_content_protection@ato=
mic@pipe-a-dp-4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_content_protection@atomic@pi=
pe-a-dp-4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_cursor_crc@cursor-slidi=
ng-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-463/igt@kms_cu=
rsor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a> -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-46=
4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/=
shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.htm=
l">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_cursor_legacy@cursora-v=
s-flipb-toggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test=
 dmesg-warn</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs=
-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_cu=
rsor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_cursor=
_legacy@torture-move@pipe-a.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_cursor_legacy@to=
rture-move@pipe-a.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +9 other =
tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_flip@2x-dpms-vs-vblank-r=
ace-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-hdmi-a2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_flip@basic-plain-flip@d-=
hdmi-a2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1214">Intel XE#1214</a>) +16 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_flip@flip-vs-dpms-off-v=
s-modeset-interruptible.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_flip@flip-vs-dp=
ms-off-vs-modeset-interruptible.html">DMESG-WARN</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#119=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214=
">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1330">Intel XE#1330</a>) +1 other test ( 1 dmesg-warn, 1 incomple=
te )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32b=
pp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">In=
tel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358=
</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@kms_flip_tiling@flip-change=
-tiling@pipe-c-dp-4-4-mc-ccs-to-linear.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +51 other=
 tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1151">Intel XE#1151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_frontbuffer_tracking@f=
bcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr=
-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_hdr@static-toggle-dpms.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
132263v2/shard-adlp-9/igt@kms_hdr@static-toggle-dpms.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_hdr@static-toggle-susp=
end@pipe-a-hdmi-a-6.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_hdr@static-toggle-suspen=
d@pipe-a-hdmi-a-6.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@kms_pi=
pe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@k=
ms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#121=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_plane@plane-panning-bott=
om-right-suspend@pipe-b.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_plane_lowres@tiling-no=
ne@pipe-a-dp-4.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_plane_lowres@tiling-non=
e@pipe-a-dp-4.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_plane_lowres@tiling-x@p=
ipe-a-hdmi-a-7.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_plane_multiple@tiling-=
y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-132263v2/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-=
hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-modifiers@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Int=
el XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-=
hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-modifiers@pipe-d-hdmi-a-2.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-d=
g2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@p=
ipe-a-hdmi-a-6.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) =
+1 other test ( 2 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_pm_backlight@bad-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@kms_pm=
_rpm@legacy-planes.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@kms_pm_rpm@legacy-plane=
s.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-132263v2/shard-dg2-435/igt@kms_pm_rpm@legacy-planes.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
11">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_pm_rpm@universal-planes.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_psr2_sf@overlay-primary-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_psr@fbc-psr2-suspend.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
32263v2/shard-dg2-463/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">=
Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_psr@psr-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_psr@psr2-basic.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2=
/shard-adlp-9/igt@kms_psr@psr2-basic.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_rotation_crc@primary-x-t=
iled-reflect-x-180.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_rotation_crc@sprite-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_setmode@clone-exclusive-=
crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-463/igt@kms_vr=
r@negative-basic.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@kms_vrr@negative-basic.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
2263v2/shard-dg2-463/igt@kms_vrr@negative-basic.html">PASS</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_ccs@block-copy-compressed=
-inc-dimension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@xe_evi=
ct@evict-beng-cm-threads-large.html">PASS</a> -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_evict@ev=
ict-beng-cm-threads-large.html">TIMEOUT</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_evict@evict-beng=
-cm-threads-large.html">TIMEOUT</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">=
Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_evict@evict-cm-threads-la=
rge-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-463/igt@xe_evi=
ct@evict-mixed-threads-large.html">PASS</a> -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_evict@evic=
t-mixed-threads-large.html">TIMEOUT</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@xe_evict@evict-mixed-th=
reads-large.html">TIMEOUT</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_evict@evict-small.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@xe_evi=
ct@evict-threads-large.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@xe_evict@evict-thre=
ads-large.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_evict@evict-threads-large.html">TIM=
EOUT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@xe_evi=
ct@evict-threads-small-multi-vm.html">PASS</a> -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_evict@e=
vict-threads-small-multi-vm.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@xe_evict@evict-threa=
ds-small-multi-vm.html">TIMEOUT</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommi=
t-standalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@xe_exec_balancer@twice-cm-vi=
rtual-rebind.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@xe_exec_fault_mode@many-ex=
ecqueues-bindexecqueue-userptr-invalidate-race.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@x=
e_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-invalidate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@xe_exec_fault_mode@man=
y-execqueues-userptr-invalidate.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_exec_fault_mode@once-use=
rptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test=
 skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_exec_fault_mode@once-user=
ptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_exec_reset@cat-error.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@xe_exe=
c_threads@threads-bal-fd-rebind.html">PASS</a> -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@xe_exec_th=
reads@threads-bal-fd-rebind.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_exec_threads@thre=
ads-bal-fd-rebind.html">TIMEOUT</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@xe_exe=
c_threads@threads-hang-fd-basic.html">PASS</a> -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_exec_th=
reads@threads-hang-fd-basic.html">TIMEOUT</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_exec_threads@t=
hreads-hang-fd-basic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356=
</a>) +1 other test ( 1 pass, 1 timeout )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-434/igt@xe_liv=
e_ktest@xe_migrate.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_live_ktest@xe_migrat=
e.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-132263v2/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1=
192</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/378">Intel XE#378</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-434/igt@xe_mod=
ule_load@unload.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_module_load@unload.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1322=
63v2/shard-dg2-464/igt@xe_module_load@unload.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_pm@d3cold-basic-exec.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs=
.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-132263v2/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLE=
TE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/119=
5">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-132263v2/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
66">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_pm@s4-basic-exec.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/104=
3">Intel XE#1043</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/845">Intel XE#845</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043=
">Intel XE#1043</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-flag-invalid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_vm@bind-flag-invalid.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1559">Intel XE#1559</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_vm@bind-flag-invalid.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1559">Intel XE#1559</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@kms_as=
ync_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-46=
3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@=
kms_async_flips@alternate-sync-async-flip.html">PASS</a>) +1 other test ( 2=
 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_at=
omic_transition@modeset-transition-fencing@2x-outputs.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel=
 XE#1214</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132263v2/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-fe=
ncing@2x-outputs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_atomic_transition@modeset-t=
ransition-fencing@2x-outputs.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@basic-force-joiner}:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_bi=
g_joiner@basic-force-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@=
kms_big_joiner@basic-force-joiner.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_big_joiner=
@basic-force-joiner.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">=
Intel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-132263v2/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-=
transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#2=
82</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
32263v2/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v=
2/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a=
>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-463/igt@kms_cu=
rsor_legacy@flip-vs-cursor-atomic-transitions.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">=
Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/910">Intel XE#910</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-c=
ursor-atomic-transitions.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@kms_cursor_legacy@flip-=
vs-cursor-atomic-transitions.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_cu=
rsor_legacy@torture-bo@pipe-b.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13226=
3v2/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-b.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg=
2-433/igt@kms_cursor_legacy@torture-bo@pipe-b.html">PASS</a>) +1 other test=
 ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@kms_pi=
pe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1322=
63v2/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-436/igt@kms_un=
iversal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-d=
g2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@km=
s_universal_plane@cursor-fb-leak.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-436/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/sha=
rd-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/=
shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">=
PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-434/igt@xe_exe=
c_threads@threads-cm-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356"=
>Intel XE#1356</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-132263v2/shard-dg2-433/igt@xe_exec_threads@threads-cm-fd-userptr=
-invalidate-race.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-u=
serptr-invalidate-race.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-466/igt@xe_exe=
c_threads@threads-hang-fd-userptr-rebind.html">TIMEOUT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel X=
E#1356</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-132263v2/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-rebin=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-132263v2/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-rebind=
.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@xe_mod=
ule_load@many-reload.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1216">Intel XE#1216</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_mod=
ule_load@many-reload.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-dg2-466/igt@xe_module_load@many-reload.=
html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-2/igt@xe_pm@s=
3-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adl=
p-2/igt@xe_pm@s3-multiple-execs.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@xe_pm@s3-multiple=
-execs.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-9/igt@core_ho=
tunplug@hotreplug.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@core_=
hotunplug@hotreplug.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@core_hotunplug@hotreplug.htm=
l">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-8/igt@core_ho=
tunplug@hotreplug-lateclose.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@=
core_hotunplug@hotreplug-lateclose.html">INCOMPLETE</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@core_hot=
unplug@hotreplug-lateclose.html">ABORT</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-4/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Int=
el XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/358">Intel XE#358</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_async_flips@async-flip-wit=
h-page-flip-events.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@kms_async_flips@async-fl=
ip-with-page-flip-events.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel =
XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-4/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"=
>Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1214">Intel XE#1214</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_async_flips@async-fl=
ip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/igt@=
kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DM=
ESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests ( 2 dm=
esg-warn )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">In=
tel XE#324</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-132263v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rot=
ate-0-hflip-async-flip.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-=
stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +2 oth=
er tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel=
 XE#1231</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132263v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip-async-flip.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Inte=
l XE#324</a>) +1 other test ( 1 dmesg-fail, 1 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_co=
ntent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-=
433/igt@kms_content_protection@atomic.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@kms_conten=
t_protection@atomic.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Inte=
l XE#282</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132263v2/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-at=
omic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132263v2/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-at=
omic.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-466/igt@kms_cu=
rsor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13226=
3v2/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/s=
hard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1=
214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
2">Intel XE#282</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v=
2/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-=
adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#119=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214=
">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
2263v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-ms=
flip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-132263v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +34 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-436/igt@km=
s_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-9/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel X=
E#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/927">Intel XE#927</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-r=
ight-suspend.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Int=
el XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-9/igt@kms_pla=
ne@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">=
Intel XE#927</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-132263v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-sus=
pend@pipe-a.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-132263v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-=
right-suspend@pipe-a.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#=
1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
27">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-466/igt@kms_pl=
ane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132=
263v2/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-132263v2/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pi=
pe-b.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test ( 1 dmes=
g-fail, 1 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-463/igt@kms_pl=
ane_lowres@tiling-x.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg=
2-464/igt@kms_plane_lowres@tiling-x.html">DMESG-FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@kms_pl=
ane_lowres@tiling-x.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-435/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/s=
hard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13226=
3v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-8/igt@kms_pm_=
rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-ad=
lp-6/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-4/igt@kms_pm_rp=
m@drm-resources-equal.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@kms_pm=
_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132=
263v2/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2=
/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@kms_se=
quence@queue-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/=
igt@kms_sequence@queue-busy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-433/igt@kms_sequence@queue-b=
usy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-436/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/869">Intel XE#869</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/sha=
rd-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-435/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#3=
62</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/869=
">Intel XE#869</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-4/igt@kms_vbl=
ank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1=
191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
14">Intel XE#1214</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-132263v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-sus=
pend@pipe-d-hdmi-a-1.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@kms_vblank@ts-continua=
tion-dpms-suspend@pipe-d-hdmi-a-1.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-8/igt@kms_vbl=
ank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/10142">i9=
15#10142</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132263v2/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hd=
mi-a-1.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-132263v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@p=
ipe-d-hdmi-a-1.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-433/igt@xe_evi=
ct@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-=
433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-434/igt@xe=
_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-466/igt@xe_evi=
ct@evict-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1=
473</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
132263v2/shard-dg2-464/igt@xe_evict@evict-cm-threads-large-multi-vm.html">I=
NCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
32263v2/shard-dg2-433/igt@xe_evict@evict-cm-threads-large-multi-vm.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/119=
5">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-1/igt@xe_exec=
_basic@many-execqueues-userptr.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adl=
p-4/igt@xe_exec_basic@many-execqueues-userptr.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-8/igt@xe_=
exec_basic@many-execqueues-userptr.html">DMESG-WARN</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@page-sized:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-464/igt@xe_exe=
c_store@page-sized.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1270">Intel XE#1270</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-dg2-464/igt@xe_exec_s=
tore@page-sized.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_exec_store@page-sized.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
70">Intel XE#1270</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-dg2-436/igt@xe_exe=
c_threads@threads-cm-fd-userptr-rebind.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel =
XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1356">Intel XE#1356</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-132263v2/shard-dg2-463/igt@xe_exec_threads@threads-cm-fd-=
userptr-rebind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-132263v2/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-use=
rptr-rebind.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Inte=
l XE#1376</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-4/igt@xe_pm@s=
2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-4/i=
gt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10=
142</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430/shard-adlp-1/igt@xe_pm@s=
3-exec-after.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-9/=
igt@xe_pm@s3-exec-after.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-132263v2/shard-adlp-2/igt@xe_pm@s3-exec-after=
.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1191">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430 -&gt; xe-pw-132=
263v2</li>
</ul>
<p>IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-1067-284b05a047b8b3bca4682e963d8e6d93493e8430: 284b05a047b8b3bca4682e9=
63d8e6d93493e8430<br />
  xe-pw-132263v2: 132263v2</p>

</body>
</html>

--===============1087575770129146561==--
