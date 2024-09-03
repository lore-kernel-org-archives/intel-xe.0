Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BAACD37B1
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 22:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943FC10E067;
	Tue,  3 Sep 2024 22:34:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE7B10E067;
 Tue,  3 Sep 2024 22:34:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5933284814721804388=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display=3A_add_snapsho?=
 =?utf-8?q?t_capture/print_infra?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 22:34:45 -0000
Message-ID: <172540288535.930912.3108059757819284533@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725372032.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725372032.git.jani.nikula@intel.com>
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

--===============5933284814721804388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: add snapshot capture/print infra
URL   : https://patchwork.freedesktop.org/series/138150/
State : failure

== Summary ==

CI Bug Log - changes from xe-1886-7378077b0be32160022a73b7050b963d52364618_full -> xe-pw-138150v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138150v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138150v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138150v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible@ad-hdmi-a6-dp4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible@ad-hdmi-a6-dp4.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:
    - {shard-bmg}:        [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-3/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - {shard-bmg}:        [FAIL][5] ([Intel XE#2333]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-dp-2:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-dp-2.html

  
Known issues
------------

  Here are the changes found in xe-pw-138150v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-adlp:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#2317])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#324]) +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][12] -> [FAIL][13] ([Intel XE#1426]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][15] -> [FAIL][16] ([Intel XE#1426]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#1659])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1407])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#316])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#346])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1399]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1152]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#373])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#373]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#599]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#309])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#877]) +2 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-463/igt@kms_cursor_legacy@single-move.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_cursor_legacy@single-move.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1421]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#886]) +3 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][40] ([Intel XE#1195] / [Intel XE#2049])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1401]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#651])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#651]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#656]) +12 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#656])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1195]) +2 other tests incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-435/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#599])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1450]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1450] / [Intel XE#599])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][55] -> [DMESG-FAIL][56] ([Intel XE#324]) +2 other tests dmesg-fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-4/igt@kms_plane@plane-position-covered.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-3/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][57] -> [DMESG-WARN][58] ([Intel XE#324]) +2 other tests dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2318]) +7 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][60] -> [FAIL][61] ([Intel XE#718])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][62] ([Intel XE#1430])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#1489])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1128])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1406])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@psr2-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#929])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#756])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1091])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#688]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_balancer@twice-parallel-basic:
    - shard-adlp:         [PASS][71] -> [TIMEOUT][72] ([Intel XE#2662])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@xe_exec_balancer@twice-parallel-basic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_exec_balancer@twice-parallel-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1392]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@twice-basic:
    - shard-adlp:         [PASS][74] -> [TIMEOUT][75] ([Intel XE#2582])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@xe_exec_basic@twice-basic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_exec_basic@twice-basic.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-adlp:         [PASS][76] -> [FAIL][77] ([Intel XE#1069])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@xe_exec_compute_mode@twice-basic.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_fault_mode@many-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][78] ([Intel XE#1195]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@xe_exec_fault_mode@many-basic-prefetch.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#288])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_oa@buffer-fill:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#2541])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_oa@buffer-fill.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][82] -> [ABORT][83] ([Intel XE#1358] / [Intel XE#1607])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-8/igt@xe_pm@s4-basic.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][84] -> [ABORT][85] ([Intel XE#1358] / [Intel XE#1607])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-2/igt@xe_pm@s4-exec-after.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][86] -> [ABORT][87] ([Intel XE#1794])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-1/igt@xe_pm@s4-mocs.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][88] -> [FAIL][89] ([Intel XE#958])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#944])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][91] ([Intel XE#1033]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][93] ([Intel XE#1701]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-lnl:          [FAIL][95] ([Intel XE#1659]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - {shard-bmg}:        [INCOMPLETE][97] ([Intel XE#2597]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
    - {shard-bmg}:        [INCOMPLETE][99] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][101] ([Intel XE#886]) -> [PASS][102] +4 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [INCOMPLETE][103] ([Intel XE#1195] / [Intel XE#2622]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][105] ([Intel XE#1195]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane@pixel-format@pipe-b-plane-3:
    - {shard-bmg}:        [DMESG-WARN][107] ([Intel XE#877]) -> [PASS][108] +4 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-2/igt@kms_plane@pixel-format@pipe-b-plane-3.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-8/igt@kms_plane@pixel-format@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][109] ([Intel XE#324]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-5/igt@kms_plane@plane-position-hole.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2:
    - shard-lnl:          [DMESG-WARN][111] ([Intel XE#324]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][113] ([Intel XE#771] / [Intel XE#899]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
    - {shard-bmg}:        [FAIL][115] ([Intel XE#899]) -> [PASS][116] +3 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][117] ([Intel XE#899]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][119] ([Intel XE#1523]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_vblank@accuracy-idle.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][121] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [INCOMPLETE][123] -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][125] ([Intel XE#1794]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][127] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
    - shard-lnl:          [ABORT][129] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][131] ([Intel XE#958]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][134] ([Intel XE#801]) +23 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#316]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#316])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][138] ([Intel XE#316]) +6 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][139] ([Intel XE#324]) -> [FAIL][140] ([Intel XE#1231])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][141] ([Intel XE#1231]) -> [DMESG-FAIL][142] ([Intel XE#324])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][144] ([Intel XE#1124]) +7 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][146] ([Intel XE#610])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1124]) -> [SKIP][148] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][150] ([Intel XE#619]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][152] ([Intel XE#607])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#346]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#346])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_big_joiner@basic.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_big_joiner@basic.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][156] ([Intel XE#367]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][158] ([Intel XE#2191]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#2191]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#2191])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#367]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#367])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][164] ([Intel XE#787]) +69 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1252]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#1252])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#787]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][170] ([Intel XE#1252]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][172] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#306]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][178] ([Intel XE#306]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_chamelium_color@degamma.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#373]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][182] ([Intel XE#373]) +7 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][184] ([Intel XE#307])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#308]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#308])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#455]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][190] ([Intel XE#308]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][192] ([Intel XE#323])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#323]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#323])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][195] ([i915#3804]) -> [SKIP][196] ([Intel XE#1201] / [i915#3804])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#701]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#701])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][200] ([Intel XE#1135])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_feature_discovery@psr1.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][202] ([Intel XE#651]) +27 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#651]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][206] ([Intel XE#1158])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][208] ([Intel XE#653]) +28 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#653]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#653]) +24 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][212] ([Intel XE#356])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][214] ([Intel XE#2318] / [Intel XE#455]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][216] ([Intel XE#2318]) +8 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2318]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][222] ([Intel XE#870]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_pm_backlight@fade.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#908]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#908])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1489]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][228] ([Intel XE#1489]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][230] ([Intel XE#1122]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][232] ([Intel XE#929]) +12 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#929]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#327]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][238] ([Intel XE#327])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][240] ([Intel XE#1500])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][242] ([Intel XE#2168])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_vrr@cmrr.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][244] ([Intel XE#455]) +21 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_vrr@flipline.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#756]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#756])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1091]) -> [SKIP][248] ([Intel XE#1091] / [Intel XE#1201])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][250] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1123]) -> [SKIP][252] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][254] ([Intel XE#1123])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][256] ([Intel XE#1126])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][257] ([Intel XE#1473]) -> [FAIL][258] ([Intel XE#1000])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][260] ([Intel XE#288]) +22 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#288]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#288]) +20 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][264] ([Intel XE#2360])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][266] ([Intel XE#378])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2541]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][270] ([Intel XE#2541]) +6 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][272] ([Intel XE#2284])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][274] ([Intel XE#2284] / [Intel XE#366])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][276] ([Intel XE#579])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][278] ([Intel XE#944])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#944]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@xe_query@multigpu-query-topology.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2582]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2582
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2662]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2662
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-1886-7378077b0be32160022a73b7050b963d52364618 -> xe-pw-138150v1

  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1886-7378077b0be32160022a73b7050b963d52364618: 7378077b0be32160022a73b7050b963d52364618
  xe-pw-138150v1: 138150v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/index.html

--===============5933284814721804388==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: add snapshot capture/print infra</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138150/">https://patchwork.freedesktop.org/series/138150/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1886-7378077b0be32160022a73b7050b963d52364618_full -&gt; xe-pw-138150v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138150v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138150v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138150v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-panning-interruptible@ad-hdmi-a6-dp4:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible@ad-hdmi-a6-dp4.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-3/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-dp-2:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138150v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317">Intel XE#2317</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-463/igt@kms_cursor_legacy@single-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-435/igt@kms_hdr@static-toggle-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-4/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-3/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@xe_exec_balancer@twice-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_exec_balancer@twice-parallel-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2662">Intel XE#2662</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@xe_exec_basic@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_exec_basic@twice-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2582">Intel XE#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_exec_compute_mode@twice-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@xe_exec_fault_mode@many-basic-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-2/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-2/igt@kms_plane@pixel-format@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-8/igt@kms_plane@pixel-format@pipe-b-plane-3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-5/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-5/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1886-7378077b0be32160022a73b7050b963d52364618/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138150v1/shard-dg2-436/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1886-7378077b0be32160022a73b7050b963d52364618 -&gt; xe-pw-138150v1</li>
</ul>
<p>IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1886-7378077b0be32160022a73b7050b963d52364618: 7378077b0be32160022a73b7050b963d52364618<br />
  xe-pw-138150v1: 138150v1</p>

</body>
</html>

--===============5933284814721804388==--
