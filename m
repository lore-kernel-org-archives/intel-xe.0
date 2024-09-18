Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430A5CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 08:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFC810E562;
	Wed, 18 Sep 2024 08:25:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C893F10E562;
 Wed, 18 Sep 2024 08:25:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1452184612444045100=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_memirq_infra_changes_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 08:25:57 -0000
Message-ID: <172664795780.1025001.18271798851370820472@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918053942.1331811-1-illevi@habana.ai>
In-Reply-To: <20240918053942.1331811-1-illevi@habana.ai>
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

--===============1452184612444045100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: memirq infra changes (rev7)
URL   : https://patchwork.freedesktop.org/series/137643/
State : failure

== Summary ==

CI Bug Log - changes from xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df_full -> xe-pw-137643v7_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137643v7_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137643v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137643v7_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-8/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-2/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - {shard-bmg}:        [INCOMPLETE][3] ([Intel XE#2566]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - {shard-bmg}:        [SKIP][6] ([Intel XE#1130]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html

  
Known issues
------------

  Here are the changes found in xe-pw-137643v7_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#1426]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][10] -> [FAIL][11] ([Intel XE#1426]) +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#1426]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#1659])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1512])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1399]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][24] -> [FAIL][25] ([Intel XE#616])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#307])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1424])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#323])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#703])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1421])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#886]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1397] / [Intel XE#1745])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1397])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#651]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#656]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][42] -> [DMESG-WARN][43] ([Intel XE#324]) +3 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][44] -> [FAIL][45] ([Intel XE#1874]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2763]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#736])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#1430])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1128])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1406])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_psr@pr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1437])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1499] / [Intel XE#599])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][56] -> [TIMEOUT][57] ([Intel XE#1473])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#688]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@xe_evict@evict-threads-small.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1392]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#1069])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-5/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@xe_exec_fault_mode@many-basic-prefetch.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-lnl:          [PASS][63] -> [DMESG-WARN][64] ([Intel XE#2046])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-7/igt@xe_exec_reset@gt-reset-stress.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-7/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1061])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@xe_peer2peer@read.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][68] -> [ABORT][69] ([Intel XE#1358] / [Intel XE#1607])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-2/igt@xe_pm@s4-exec-after.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][70] -> [ABORT][71] ([Intel XE#1794])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-4/igt@xe_pm@s4-mocs.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#958])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#944])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][75] ([Intel XE#1701]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][77] ([Intel XE#1426]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][79] ([Intel XE#877]) -> [PASS][80] +4 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][81] ([Intel XE#1503]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][83] ([Intel XE#324]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][85] ([Intel XE#1874]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][87] ([Intel XE#361]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:
    - {shard-bmg}:        [INCOMPLETE][89] -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [DMESG-FAIL][91] ([Intel XE#1620]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-7/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][93] ([Intel XE#899]) -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][95] ([Intel XE#1523]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-4/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [FAIL][97] ([Intel XE#2443]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-5/igt@kms_vrr@flip-dpms.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@kms_vrr@flip-dpms.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][99] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][101] ([Intel XE#1473]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html
    - shard-dg2-set2:     [TIMEOUT][103] ([Intel XE#1473]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][105] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][107] ([Intel XE#1069]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     [DMESG-WARN][109] ([Intel XE#2559]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [FAIL][111] ([Intel XE#2723]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-8/igt@xe_oa@oa-exponents.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@xe_oa@oa-exponents.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][113] ([Intel XE#1794]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [FAIL][115] -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#873]) -> [SKIP][118] ([Intel XE#873])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][120] ([Intel XE#316])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#316]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#316])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][123] ([Intel XE#1231]) -> [FAIL][124] ([Intel XE#1242])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1124]) -> [SKIP][126] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][128] ([Intel XE#1124]) +8 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#2191]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][132] ([Intel XE#367]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#367]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#367])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1252]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#787]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][142] ([Intel XE#787]) +48 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][144] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][146] ([Intel XE#1252]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#373]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#306]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#306])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][152] ([Intel XE#306])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_chamelium_color@gamma.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][154] ([Intel XE#373]) +6 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][156] ([Intel XE#307])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#308]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][160] ([Intel XE#323])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#776]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#776])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#455]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][166] ([Intel XE#651]) +21 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#651]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#651]) +12 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#658]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#658])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#653]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#653]) +14 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][174] ([Intel XE#653]) +20 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][176] ([Intel XE#455]) +14 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][177] ([Intel XE#324]) -> [DMESG-WARN][178] ([Intel XE#324])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-2/igt@kms_plane@plane-position-hole.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@kms_plane@plane-position-hole.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#870]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#870])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1489]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][184] ([Intel XE#1489]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][186] ([Intel XE#1122])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#929]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][190] ([Intel XE#929]) +10 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_psr@psr-dpms.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#327]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#327])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][194] ([Intel XE#327])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#1500])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][198] ([Intel XE#2168])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_vrr@lobf.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][200] ([Intel XE#756])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#756]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][206] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][208] ([Intel XE#1123])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][210] ([Intel XE#1126])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-imm:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#288]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][214] ([Intel XE#288]) +18 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2360]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#2360])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][218] ([Intel XE#2229])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#560]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#560])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_media_fill@media-fill.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@non-zero-reason:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][222] ([Intel XE#2541]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_oa@non-zero-reason.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_oa@non-zero-reason.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2541]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_oa@polling-small-buf.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_oa@polling-small-buf.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][226] ([Intel XE#2284] / [Intel XE#366])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][230] ([Intel XE#944]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#944]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [FAIL][233] -> [SKIP][234] ([Intel XE#1130] / [Intel XE#1201])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2559
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df -> xe-pw-137643v7

  IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df: 911b00e59ae28dd315d10bfb6e030bbb221ba4df
  xe-pw-137643v7: 137643v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/index.html

--===============1452184612444045100==
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
<tr><td><b>Series:</b></td><td>memirq infra changes (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137643/">https://patchwork.freedesktop.org/series/137643/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df_full -&gt; xe-pw-137643v7_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137643v7_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137643v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137643v7_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-8/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-2/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137643v7_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-5/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@xe_exec_fault_mode@many-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-7/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-7/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2046">Intel XE#2046</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-2/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-4/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-435/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-7/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-4/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-5/igt@kms_vrr@flip-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@kms_vrr@flip-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2559">Intel XE#2559</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-8/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@xe_oa@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-lnl-3/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v7/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df -&gt; xe-pw-137643v7</li>
</ul>
<p>IGT_8023: 20a0ae35cb9fbae774dce8b78e20b2eb658171aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1963-911b00e59ae28dd315d10bfb6e030bbb221ba4df: 911b00e59ae28dd315d10bfb6e030bbb221ba4df<br />
  xe-pw-137643v7: 137643v7</p>

</body>
</html>

--===============1452184612444045100==--
