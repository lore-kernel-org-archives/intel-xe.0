Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2CCD68BED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 08:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1577610E2E4;
	Thu, 18 Dec 2025 08:09:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1705210E2E4;
 Thu, 18 Dec 2025 08:09:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3240391823913736671=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Drop_preempt-fen?=
 =?utf-8?q?ces_when_destroying_imported_dma-bufs=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Dec 2025 08:09:28 -0000
Message-ID: <176604536807.98733.17527419213736333285@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217093441.5073-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251217093441.5073-1-thomas.hellstrom@linux.intel.com>
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

--===============3240391823913736671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Drop preempt-fences when destroying imported dma-bufs.
URL   : https://patchwork.freedesktop.org/series/159143/
State : failure

== Summary ==

CI Bug Log - changes from xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0_FULL -> xe-pw-159143v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159143v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159143v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159143v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_vblank@wait-forked@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][6] +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_vblank@wait-forked@pipe-a-dp-2.html

  
#### Warnings ####

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][7] ([Intel XE#2934] / [Intel XE#6590]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_vblank@wait-forked:
    - shard-bmg:          [SKIP][9] ([Intel XE#6703]) -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_vblank@wait-forked.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_vblank@wait-forked.html

  
Known issues
------------

  Here are the changes found in xe-pw-159143v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#6779])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@core_hotunplug@hotrebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@core_hotunplug@hotrebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#6815])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@device_reset@unbind-reset-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#5177] / [Intel XE#6703])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@intel_hwmon@hwmon-write.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_3d@basic:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#6011])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_3d@basic.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +10 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2652] / [Intel XE#787]) +21 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#3432])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2325])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178]) +3 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2291]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4302])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2244]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#776])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1421])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2316]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2316]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#301] / [Intel XE#3149])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2293]) +8 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2311]) +14 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4141]) +7 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#656]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#651]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2313]) +11 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2312]) +9 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][48] ([Intel XE#6740]) +1 other test abort
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2393])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#5020])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#6886]) +12 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#6693])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#6693]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1406] / [Intel XE#6703]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1406] / [Intel XE#2387])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2330])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_sequence@get-busy@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][62] ([Intel XE#5254])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_sequence@get-busy@pipe-b-dp-2.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#1435])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6503])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1499]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@kms_vrr@flip-basic.html

  * igt@xe_configfs@survivability-mode:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#6010])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-7/igt@xe_configfs@survivability-mode.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4837]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#4837])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#4837] / [Intel XE#6665])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-3/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#6665] / [Intel XE#6681])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#688])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-3/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2322]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1392])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#6703]) +490 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#6874])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#6874]) +16 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [PASS][80] -> [WARN][81] ([Intel XE#5786])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@process-many-large-new-nomemset:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#6557] / [Intel XE#6703]) +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4943]) +11 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#4943]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#6557] / [Intel XE#6703]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#2229]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2245])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2427])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_peer2peer@write.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#6251])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#6703]) +240 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#944]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-size.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [SKIP][95] ([Intel XE#6779]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [SKIP][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][99] ([Intel XE#2134]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@fbdev@eof.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@fbdev@eof.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][101] ([Intel XE#2316]) -> [PASS][102] +3 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][103] ([Intel XE#301]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][105] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [SKIP][107] ([Intel XE#6693]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][109] ([Intel XE#1406] / [Intel XE#4692]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@testdisplay:
    - shard-bmg:          [ABORT][111] -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@testdisplay.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@testdisplay.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-idle:
    - shard-bmg:          [SKIP][113] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][114] +2 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          [SKIP][115] ([Intel XE#6703]) -> [PASS][116] +330 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][117] ([Intel XE#5625]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [FAIL][119] ([Intel XE#6251]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][121] ([Intel XE#6703]) -> [SKIP][122] ([Intel XE#2233])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][123] ([Intel XE#2370]) -> [SKIP][124] ([Intel XE#6703])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][125] ([Intel XE#2327]) -> [SKIP][126] ([Intel XE#6703]) +6 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][127] ([Intel XE#2328]) -> [SKIP][128] ([Intel XE#6703])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][129] ([Intel XE#607]) -> [SKIP][130] ([Intel XE#6703])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][131] ([Intel XE#6703]) -> [SKIP][132] ([Intel XE#1124]) +6 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][133] ([Intel XE#1124]) -> [SKIP][134] ([Intel XE#6703]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][135] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][136] ([Intel XE#6703])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][137] ([Intel XE#6703]) -> [SKIP][138] ([Intel XE#2314] / [Intel XE#2894])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][139] ([Intel XE#367]) -> [SKIP][140] ([Intel XE#6703]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][141] ([Intel XE#6703]) -> [SKIP][142] ([Intel XE#367])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#2887]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][145] ([Intel XE#2887]) -> [SKIP][146] ([Intel XE#6703]) +9 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][147] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][148] ([Intel XE#6703])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][149] ([Intel XE#6703]) -> [SKIP][150] ([Intel XE#2652] / [Intel XE#787])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][151] ([Intel XE#6703]) -> [SKIP][152] ([Intel XE#3432]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][153] ([Intel XE#3432]) -> [SKIP][154] ([Intel XE#6703]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][155] ([Intel XE#2724]) -> [SKIP][156] ([Intel XE#6703])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_cdclk@plane-scaling.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][157] ([Intel XE#6703]) -> [SKIP][158] ([Intel XE#2325]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][159] ([Intel XE#2325]) -> [SKIP][160] ([Intel XE#6703]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_chamelium_color@degamma.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          [SKIP][161] ([Intel XE#2252]) -> [SKIP][162] ([Intel XE#6703]) +8 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-read.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          [SKIP][163] ([Intel XE#6703]) -> [SKIP][164] ([Intel XE#2252]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][165] ([Intel XE#2341]) -> [SKIP][166] ([Intel XE#6703]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_content_protection@content-type-change.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][167] ([Intel XE#2390]) -> [SKIP][168] ([Intel XE#6703]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][169] ([Intel XE#2320]) -> [SKIP][170] ([Intel XE#6703]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][171] ([Intel XE#6703]) -> [SKIP][172] ([Intel XE#2320]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][173] ([Intel XE#2321]) -> [SKIP][174] ([Intel XE#6703]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [SKIP][175] ([Intel XE#2291]) -> [SKIP][176] ([Intel XE#6703]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][177] ([Intel XE#6703]) -> [FAIL][178] ([Intel XE#6715])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#1508])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][181] ([Intel XE#4210]) -> [SKIP][182] ([Intel XE#6703])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][183] ([Intel XE#4331]) -> [SKIP][184] ([Intel XE#6703])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][185] ([Intel XE#2244]) -> [SKIP][186] ([Intel XE#6703])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_dsc@dsc-basic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][187] ([Intel XE#2372]) -> [SKIP][188] ([Intel XE#6703])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][189] ([Intel XE#2373]) -> [SKIP][190] ([Intel XE#6703])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_feature_discovery@display-3x.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][191] ([Intel XE#2316]) -> [SKIP][192] ([Intel XE#6703]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][193] ([Intel XE#6703]) -> [SKIP][194] ([Intel XE#2316]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][195] ([Intel XE#3149] / [Intel XE#5352]) -> [SKIP][196] ([Intel XE#6703])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][197] ([Intel XE#301]) -> [FAIL][198] ([Intel XE#301] / [Intel XE#3149])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][199] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][200] ([Intel XE#6703]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][201] ([Intel XE#2380]) -> [SKIP][202] ([Intel XE#6703])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][205] ([Intel XE#6703]) -> [SKIP][206] ([Intel XE#2312]) +6 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][207] ([Intel XE#2312]) -> [SKIP][208] ([Intel XE#6703]) +13 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [SKIP][210] ([Intel XE#2311]) +5 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][211] ([Intel XE#6703]) -> [SKIP][212] ([Intel XE#2311]) +11 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][213] ([Intel XE#2311]) -> [SKIP][214] ([Intel XE#6703]) +20 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][215] ([Intel XE#2312]) -> [SKIP][216] ([Intel XE#4141]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][217] ([Intel XE#4141]) -> [SKIP][218] ([Intel XE#2312])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][219] ([Intel XE#4141]) -> [SKIP][220] ([Intel XE#6703]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][221] ([Intel XE#6703]) -> [SKIP][222] ([Intel XE#4141]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][223] ([Intel XE#2311]) -> [SKIP][224] ([Intel XE#2312]) +4 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][225] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][226] ([Intel XE#2311])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][227] ([Intel XE#2313]) -> [SKIP][228] ([Intel XE#6557] / [Intel XE#6703])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][229] ([Intel XE#2313]) -> [SKIP][230] ([Intel XE#6703]) +15 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][231] ([Intel XE#2313]) -> [SKIP][232] ([Intel XE#2312]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][233] ([Intel XE#6703]) -> [SKIP][234] ([Intel XE#2313]) +13 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][235] ([Intel XE#2312]) -> [SKIP][236] ([Intel XE#2313]) +7 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [ABORT][237] ([Intel XE#6740]) -> [SKIP][238] ([Intel XE#6703]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][239] ([Intel XE#3544]) -> [SKIP][240] ([Intel XE#3374] / [Intel XE#3544])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          [SKIP][241] ([Intel XE#2925] / [Intel XE#346]) -> [SKIP][242] ([Intel XE#6901]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-lnl:          [SKIP][243] ([Intel XE#2925]) -> [SKIP][244] ([Intel XE#4298])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-5/igt@kms_joiner@basic-max-non-joiner.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-8/igt@kms_joiner@basic-max-non-joiner.html
    - shard-bmg:          [SKIP][245] ([Intel XE#6590]) -> [SKIP][246] ([Intel XE#4298])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][247] ([Intel XE#3012] / [Intel XE#6590]) -> [SKIP][248] ([Intel XE#6703])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][249] ([Intel XE#2934] / [Intel XE#6590]) -> [SKIP][250] ([Intel XE#6703])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-lnl:          [SKIP][251] ([Intel XE#2925]) -> [SKIP][252] ([Intel XE#6900]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          [SKIP][253] ([Intel XE#2925] / [Intel XE#2927]) -> [SKIP][254] ([Intel XE#6900])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-bmg:          [SKIP][255] ([Intel XE#2927] / [Intel XE#6590]) -> [SKIP][256] ([Intel XE#6703])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][257] ([Intel XE#2486]) -> [SKIP][258] ([Intel XE#6703])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_panel_fitting@legacy.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][259] ([Intel XE#2393]) -> [SKIP][260] ([Intel XE#6703])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][261] ([Intel XE#4596]) -> [SKIP][262] ([Intel XE#6703])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][263] ([Intel XE#6703]) -> [SKIP][264] ([Intel XE#6886]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][265] ([Intel XE#6703]) -> [SKIP][266] ([Intel XE#870])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][267] ([Intel XE#2499]) -> [SKIP][268] ([Intel XE#6703])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][269] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][270] ([Intel XE#6693])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [SKIP][271] ([Intel XE#6693]) -> [DMESG-WARN][272] ([Intel XE#3428])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pm_rpm@system-suspend-modeset.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][273] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][274] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][275] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][276] ([Intel XE#1406] / [Intel XE#6703]) +9 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][277] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][278] ([Intel XE#1406] / [Intel XE#2387])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][279] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][280] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][281] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][282] ([Intel XE#1406] / [Intel XE#6703]) +9 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][283] ([Intel XE#1406] / [Intel XE#2414]) -> [SKIP][284] ([Intel XE#1406] / [Intel XE#6703])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][285] ([Intel XE#2330]) -> [SKIP][286] ([Intel XE#6703]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][287] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][288] ([Intel XE#6703]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][289] ([Intel XE#6703]) -> [SKIP][290] ([Intel XE#3414] / [Intel XE#3904])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          [SKIP][291] ([Intel XE#6703]) -> [DMESG-WARN][292] ([Intel XE#5254])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_sequence@get-busy.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_sequence@get-busy.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][293] ([Intel XE#6503]) -> [SKIP][294] ([Intel XE#6703]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_sharpness_filter@filter-formats.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][295] ([Intel XE#6703]) -> [SKIP][296] ([Intel XE#6503]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][297] ([Intel XE#2168]) -> [SKIP][298] ([Intel XE#6703])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_vrr@cmrr.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][299] ([Intel XE#6703]) -> [SKIP][300] ([Intel XE#1499])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_vrr@flip-dpms.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][301] ([Intel XE#1499]) -> [SKIP][302] ([Intel XE#6703])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][303] ([Intel XE#4837]) -> [SKIP][304] ([Intel XE#6703]) +6 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-bmg:          [SKIP][305] ([Intel XE#6703]) -> [SKIP][306] ([Intel XE#4837]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-extended.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          [SKIP][307] ([Intel XE#6703]) -> [SKIP][308] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudebug_online@basic-breakpoint.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          [SKIP][309] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][310] ([Intel XE#6703]) +5 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-bmg:          [SKIP][311] ([Intel XE#6703]) -> [SKIP][312] ([Intel XE#6665] / [Intel XE#6681])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][313] ([Intel XE#5793]) -> [SKIP][314] ([Intel XE#6703])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][315] ([Intel XE#2322]) -> [SKIP][316] ([Intel XE#6703]) +5 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][317] ([Intel XE#6703]) -> [SKIP][318] ([Intel XE#2322]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:
    - shard-bmg:          [SKIP][319] ([Intel XE#6703]) -> [SKIP][320] ([Intel XE#6874]) +15 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][321] ([Intel XE#6874]) -> [SKIP][322] ([Intel XE#6703]) +26 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge:
    - shard-bmg:          [SKIP][323] ([Intel XE#6703]) -> [SKIP][324] ([Intel XE#5007]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-huge.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - shard-bmg:          [SKIP][325] ([Intel XE#5007]) -> [SKIP][326] ([Intel XE#6703]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][327] ([Intel XE#4943]) -> [SKIP][328] ([Intel XE#6703]) +13 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - shard-bmg:          [SKIP][329] ([Intel XE#6703]) -> [SKIP][330] ([Intel XE#4943]) +14 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [SKIP][331] ([Intel XE#6703]) -> [ABORT][332] ([Intel XE#5466])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [SKIP][339], [PASS][340], [ABORT][341], [ABORT][342], [PASS][343], [ABORT][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357]) ([Intel XE#2457] / [Intel XE#6887]) -> ([PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [SKIP][376], [PASS][377], [ABORT][378], [ABORT][379], [ABORT][380], [PASS][381], [PASS][382]) ([Intel XE#2457] / [Intel XE#6818])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-6/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-6/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-6/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-6/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-6/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-6/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][383] ([Intel XE#6703]) -> [SKIP][384] ([Intel XE#2236])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][385] ([Intel XE#6703]) -> [SKIP][386] ([Intel XE#5694])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][387] ([Intel XE#2284]) -> [SKIP][388] ([Intel XE#6703])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][389] ([Intel XE#6703]) -> [SKIP][390] ([Intel XE#2284])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][391] ([Intel XE#4733]) -> [SKIP][392] ([Intel XE#6703]) +2 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          [SKIP][393] ([Intel XE#6703]) -> [SKIP][394] ([Intel XE#4733]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pxp@pxp-optout.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][395] ([Intel XE#944]) -> [SKIP][396] ([Intel XE#6703]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          [SKIP][397] ([Intel XE#6703]) -> [SKIP][398] ([Intel XE#944])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_query@multigpu-query-pxp-status.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5254
  [Intel XE#5352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815
  [Intel XE#6818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6818
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6887
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8668 -> IGT_8669
  * Linux: xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0 -> xe-pw-159143v1

  IGT_8668: 906681747a312ef11ef9af8ab1fa6eff28b4cbd0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8669: 319db2ffba419f9711acc72895f065a818905efa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0: 2eb2f8746a879f1c0e4c56b715c179424dafd8e0
  xe-pw-159143v1: 159143v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/index.html

--===============3240391823913736671==
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
<tr><td><b>Series:</b></td><td>drm/xe: Drop preempt-fences when destroying =
imported dma-bufs.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159143/">https://patchwork.freedesktop.org/series/159143/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159143v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159143v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4255-2eb2f8746a879f1c0e4c56b715c179424=
dafd8e0_FULL -&gt; xe-pw-159143v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159143v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159143v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1591=
43v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_big_=
fb@4-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_big_fb@4-tiled=
-8bpp-rotate-180.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-=
lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_joiner@basic-force-big-jo=
iner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_vblank@wait-forked@pipe-a=
-dp-2.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard=
-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_vbla=
nk@wait-forked.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_vblank@wait-=
forked.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159143v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@core_hot=
unplug@hotrebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@core_hotunplug@hotrebind.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@device_r=
eset@unbind-reset-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@device_reset@unbind-=
reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6815">Intel XE#6815</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@intel_hw=
mon@hwmon-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
177">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_3d@basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011">Intel =
XE#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_bw@linear-tiling-4-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-7/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscree=
n-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/ig=
t@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#=
2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-expired-v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_flip@2x-wf_vblank-=
ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-=
2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +12 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_pm_rpm@package-g7.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/669=
3">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_pm_r=
pm@universal-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_pm_rpm@universal=
-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6693">Intel XE#6693</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_psr@fbc-psr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_sequence@get-busy@pipe-b-=
dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5254">Intel XE#5254</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-=
filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">=
Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-7/igt@xe_configfs@survivability-mod=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6010">Intel XE#6010</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@xe_eudebug@discovery-empty-cl=
ients.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-3/igt@xe_eudebug_online@interrupt-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-w=
rite-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6665">Intel XE#6665</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-3/igt@xe_evict@evict-beng-small-ext=
ernal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exe=
c-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_exec_=
basic@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/=
igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) +490 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-2/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queue=
s-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6874">Intel XE#6874</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/ig=
t@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5=
786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_exec_=
system_allocator@process-many-large-new-nomemset.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/=
igt@xe_exec_system_allocator@process-many-large-new-nomemset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Inte=
l XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_exec_system_allocator@thre=
ads-many-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge=
-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-lnl-5/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-pref=
etch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-prefetch.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_live_=
ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Int=
el XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/s=
hard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_clas=
s_copy0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) +240 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@core_hot=
unplug@unplug-rescan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@core_hotun=
plug@unplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@core_set=
master@master-drop-set-shared-fd.html">SKIP</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@core_setmast=
er@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@fbdev@eo=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_flip=
@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/s=
hard-bmg-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">=
PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_flip=
@flip-vs-suspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/=
shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pm_r=
pm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms=
_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-2/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel X=
E#4692</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-159143v1/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@testdisp=
lay.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-159143v1/shard-bmg-2/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_drm_f=
dinfo@parallel-utilization-single-idle.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
143v1/shard-bmg-1/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html">=
PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_=
basic@many-execqueues-null-defer-bind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg=
-4/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">PASS</a> +330 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#=
5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159143v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx=
-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_comput=
e0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">In=
tel XE#6251</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159143v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-d=
rm_xe_engine_class_compute0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-=
1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370=
">Intel XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_big_=
fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_=
big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5=
/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
143v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/s=
hard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-159143v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/sh=
ard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/ig=
t@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_bw@l=
inear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/=
igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@=
bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms=
_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_ccs@=
bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/=
igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_ccs@=
crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/s=
hard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3=
/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Int=
el XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard=
-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_cham=
elium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@kms=
_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_chameli=
um_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_cham=
elium_edid@dp-edid-read.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_cha=
melium_edid@dp-edid-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_cham=
elium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/ig=
t@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/ig=
t@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/ig=
t@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_curs=
or_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@km=
s_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4210">Intel XE#4210</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_dirty=
fb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_dsc@=
dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_dsc@dsc-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/ig=
t@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg=
-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#231=
6</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_flip=
@absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352">Intel XE#5352</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1=
/shard-bmg-5/igt@kms_flip@absolute-wf_vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-4/igt@kms_flip@=
flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-=
yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">I=
ntel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-159143v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9143v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-=
upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-159143v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
43v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-=
bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-=
bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159143v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#41=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9143v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v=
1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/=
igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
143v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indf=
b-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/=
shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159143v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
43v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159143v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
43v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159143v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_hdr@=
bpc-switch-dpms.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_hdr@bpc-sw=
itch-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_join=
er@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2925">Intel XE#2925</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-2/ig=
t@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-5/igt@kms_join=
er@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl-8/igt@kms_joi=
ner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_join=
er@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@kms_joi=
ner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
43v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">=
Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
43v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-2/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-lnl=
-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#690=
0</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-2/igt@kms_join=
er@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/s=
hard-lnl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6=
900</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_join=
er@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/s=
hard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
143v1/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fact=
or-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_pm_=
backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bm=
g-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pm_r=
pm@system-suspend-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_p=
m_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr2=
_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
43v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_psr2=
_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/s=
hard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1=
406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bm=
g-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2=
387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr@=
psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_=
psr@psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_psr@=
psr2-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/sha=
rd-bmg-5/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel X=
E#2414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-159143v1/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bm=
g-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
43v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bm=
g-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3=
414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/39=
04">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_sequ=
ence@get-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@kms_sequence@get-=
busy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5254">Intel XE#5254</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_shar=
pness_filter@filter-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms=
_sharpness_filter@filter-formats.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_shar=
pness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bm=
g-1/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6=
503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_vrr@=
flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@kms_vrr@flip-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_vrr@=
seamless-rr-switch-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@kms_vrr=
@seamless-rr-switch-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_eudeb=
ug@basic-vm-access-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_e=
udebug@basic-vm-access-userptr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudeb=
ug@basic-vm-bind-extended.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@xe_eu=
debug@basic-vm-bind-extended.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudeb=
ug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_e=
udebug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_eudeb=
ug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6=
665</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59143v1/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudeb=
ug_online@pagefault-read-stress.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/ig=
t@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#=
6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_eudeb=
ug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_eudebu=
g_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-159143v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-v=
m-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqu=
eues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/=
shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6874">Intel XE#6874</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#68=
74</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9143v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-i=
nvalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_=
system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4=
/igt@xe_exec_system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_exec_=
system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-b=
mg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@xe_exec_=
system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1591=
43v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-new-huge.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9143v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap=
-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4943">Intel XE#4943</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/s=
hard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0=
/shard-bmg-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424daf=
d8e0/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c17942=
4dafd8e0/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c=
179424dafd8e0/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c5=
6b715c179424dafd8e0/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0=
e4c56b715c179424dafd8e0/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a87=
9f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f874=
6a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2=
f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-=
2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e=
0/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6887">Intel XE#688=
7</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9143v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9143v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159143v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9143v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9143v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bm=
g-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9143v1/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159143v1/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6818">Intel XE#6818</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pat@p=
at-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_pat@pat-index=
-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-8/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_pm@d3=
cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_pm@d3cold-mma=
p-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_pxp@d=
isplay-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-5/igt@xe_pxp@display-px=
p-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pxp@p=
xp-optout.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-4/igt@xe_pxp@pxp-optout.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_query=
@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-b=
mg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_query=
@multigpu-query-pxp-status.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159143v1/shard-bmg-2/igt@xe_q=
uery@multigpu-query-pxp-status.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8668 -&gt; IGT_8669</li>
<li>Linux: xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0 -&gt; xe-pw-159=
143v1</li>
</ul>
<p>IGT_8668: 906681747a312ef11ef9af8ab1fa6eff28b4cbd0 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8669: 319db2ffba419f9711acc72895f065a818905efa @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0: 2eb2f8746a879f1c0e4c56b=
715c179424dafd8e0<br />
  xe-pw-159143v1: 159143v1</p>

</body>
</html>

--===============3240391823913736671==--
