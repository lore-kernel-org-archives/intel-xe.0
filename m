Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA981EEE27C
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 14:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A0110E0E6;
	Fri, 13 Sep 2024 14:10:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E52B10E0E6;
 Fri, 13 Sep 2024 14:10:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7184332132280609786=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Restore_pci_state_upo?=
 =?utf-8?q?n_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 14:10:07 -0000
Message-ID: <172623660710.996788.17880322431857179261@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912190530.435976-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240912190530.435976-1-rodrigo.vivi@intel.com>
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

--===============7184332132280609786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Restore pci state upon resume
URL   : https://patchwork.freedesktop.org/series/138607/
State : failure

== Summary ==

CI Bug Log - changes from xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc_full -> xe-pw-138607v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138607v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138607v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138607v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-1/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-138607v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#1701]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][5] -> [FAIL][6] ([Intel XE#1426]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#1659]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#607])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#346])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1399]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#306])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#373])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#307])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#308])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#323])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-lnl:          [PASS][25] -> [DMESG-WARN][26] ([Intel XE#877]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-7/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#599]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1195]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-433/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a6-dp4.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#886]) +2 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#1874]) +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#352])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#656]) +18 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#651]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#656]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][41] -> [SKIP][42] ([Intel XE#1201] / [Intel XE#455])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-2:
    - shard-lnl:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#324]) +1 other test dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-2.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-2.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [PASS][45] -> [DMESG-FAIL][46] ([Intel XE#324])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][47] ([Intel XE#1874]) +3 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1439])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1406])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1149] / [Intel XE#1201])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#327])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1437])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][56] -> [FAIL][57] ([Intel XE#771] / [Intel XE#899])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][58] -> [FAIL][59] ([Intel XE#899])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1123] / [Intel XE#1201])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#688])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1392])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#1069])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-2/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr-imm.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][69] ([Intel XE#1962])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][70] ([Intel XE#1999]) +2 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@enable-disable:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@xe_oa@enable-disable.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#2723])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@xe_oa@oa-exponents.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-7/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][74] ([Intel XE#2723])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-7/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#944])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][78] ([Intel XE#324]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear:
    - shard-lnl:          [FAIL][80] ([Intel XE#911]) -> [PASS][81] +2 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][82] ([Intel XE#616]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][84] ([Intel XE#877]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][86] ([Intel XE#877]) -> [PASS][87] +5 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][88] -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][90] ([Intel XE#886]) -> [PASS][91] +3 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][92] ([Intel XE#1874]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][94] ([Intel XE#2622]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][96] ([Intel XE#324]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [FAIL][98] ([Intel XE#899]) -> [PASS][99] +3 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][100] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        [TIMEOUT][102] ([Intel XE#1473]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [FAIL][104] ([Intel XE#1000]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][106] ([Intel XE#1473]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_evict@evict-threads-large.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][108] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@xe_pm@s4-basic.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][110] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][113] ([Intel XE#623])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#801]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][116] ([Intel XE#324]) -> [DMESG-WARN][117] ([Intel XE#1033] / [Intel XE#324])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][118] ([Intel XE#1033]) -> [DMESG-WARN][119] ([Intel XE#324])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#316]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][123] ([Intel XE#316]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][124] ([Intel XE#1231]) -> [DMESG-FAIL][125] ([Intel XE#324])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][126] ([Intel XE#324]) -> [FAIL][127] ([Intel XE#1242])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][128] ([Intel XE#324]) -> [FAIL][129] ([Intel XE#1231]) +1 other test fail
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#610]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#610])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#1124]) -> [SKIP][133] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][134] ([Intel XE#1231]) -> [FAIL][135] ([Intel XE#1242])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][137] ([Intel XE#1124]) +10 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][139] ([Intel XE#607])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][141] ([Intel XE#346]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#367]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#2191]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#2191])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][147] ([Intel XE#2191])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][149] ([Intel XE#367]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][151] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#787]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#787]) +83 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][155] ([Intel XE#1252])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][159] ([Intel XE#787]) +69 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][161] ([Intel XE#306]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#306]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_chamelium_color@gamma.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#373]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][167] ([Intel XE#373]) +7 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][169] ([Intel XE#307]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#308]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#308])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][173] ([Intel XE#308])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][175] ([Intel XE#323])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#323]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#323])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][179] ([Intel XE#776])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_fbcon_fbt@psr.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][181] ([Intel XE#701])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][183] ([Intel XE#455]) +15 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#455]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][186] ([i915#5274]) -> [SKIP][187] ([Intel XE#1201] / [i915#5274])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][189] ([Intel XE#651]) +29 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#651]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][193] ([Intel XE#658])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#653]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#658]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#658])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][199] ([Intel XE#653]) +29 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#356]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#356])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-WARN][202] ([Intel XE#324]) -> [DMESG-FAIL][203] ([Intel XE#324])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@kms_plane@plane-position-hole.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-4/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][205] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][207] ([Intel XE#498]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#2318]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#870]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#870])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#908]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#908])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1489]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][219] ([Intel XE#1489]) +5 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][221] ([Intel XE#1122])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1122]) -> [SKIP][223] ([Intel XE#1122] / [Intel XE#1201])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#929]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][227] ([Intel XE#929]) +12 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_psr@psr2-basic.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][229] ([Intel XE#1149]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][231] ([Intel XE#327])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#327]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1127]) -> [SKIP][235] ([Intel XE#1127] / [Intel XE#1201])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][237] ([Intel XE#1729])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#1500])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#2168]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#2168])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_vrr@cmrr.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][243] ([Intel XE#2168])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_vrr@lobf.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][245] ([Intel XE#756])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][247] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][249] ([Intel XE#1123])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#1123]) -> [SKIP][251] ([Intel XE#1123] / [Intel XE#1201])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1126]) -> [SKIP][253] ([Intel XE#1126] / [Intel XE#1201])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [FAIL][254] ([Intel XE#1000]) -> [TIMEOUT][255] ([Intel XE#1473])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][257] ([Intel XE#288]) +22 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#288]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2360]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#2360])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#378]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#378])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_module_load@force-load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][265] ([Intel XE#2541]) +3 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_oa@oa-tlb-invalidate.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2541]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_oa@rc6-disable.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1337]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#1337])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][271] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#944]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][275] ([Intel XE#944]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
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
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
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
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
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
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc -> xe-pw-138607v1

  IGT_8015: 8015
  xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc: 9fd27ed0883cff53777b8db0b7c6db327132dcdc
  xe-pw-138607v1: 138607v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/index.html

--===============7184332132280609786==
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
<tr><td><b>Series:</b></td><td>drm/xe: Restore pci state upon resume</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138607/">https://patchwork.freedesktop.org/series/138607/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc_full -&gt; xe-pw-138607v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138607v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138607v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138607v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-1/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138607v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-7/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-433/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-3/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-2/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@xe_oa@enable-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@xe_oa@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-7/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-7/igt@xe_oa@oa-exponents@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-8/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-lnl-8/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-lnl-4/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138607v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc -&gt; xe-pw-138607v1</li>
</ul>
<p>IGT_8015: 8015<br />
  xe-1939-9fd27ed0883cff53777b8db0b7c6db327132dcdc: 9fd27ed0883cff53777b8db0b7c6db327132dcdc<br />
  xe-pw-138607v1: 138607v1</p>

</body>
</html>

--===============7184332132280609786==--
