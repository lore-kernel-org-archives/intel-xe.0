Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CBDC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 16:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3784D10EE2C;
	Fri, 10 May 2024 16:16:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC6410E5BF;
 Fri, 10 May 2024 16:16:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8311007997916013063=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/bmg=3A_Load_DMC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 May 2024 16:16:40 -0000
Message-ID: <171535780088.2056703.13847059047527704764@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240510140532.112352-2-gustavo.sousa@intel.com>
In-Reply-To: <20240510140532.112352-2-gustavo.sousa@intel.com>
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

--===============8311007997916013063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/bmg: Load DMC
URL   : https://patchwork.freedesktop.org/series/133451/
State : failure

== Summary ==

CI Bug Log - changes from xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6_full -> xe-pw-133451v1_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-133451v1_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133451v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133451v1_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-adlp:         [FAIL][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-8/igt@kms_lease@setcrtc-implicit-plane.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-4/igt@kms_lease@setcrtc-implicit-plane.html

  
Known issues
------------

  Here are the changes found in xe-pw-133451v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         NOTRUN -> [ABORT][3] ([Intel XE#1538] / [Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@core_hotunplug@hotreplug.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#1201] / [Intel XE#660])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][5] ([Intel XE#650]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201]) +8 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][9] ([Intel XE#1204])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][10] ([Intel XE#1231])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#787]) +44 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#787]) +26 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][17] ([Intel XE#1188])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-433/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [PASS][18] -> [SKIP][19] ([Intel XE#1201] / [i915#2575]) +72 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#776])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1137] / [Intel XE#1201])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#310])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1195]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][29] -> [FAIL][30] ([Intel XE#616])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#656]) +22 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_plane@pixel-format@pipe-b:
    - shard-adlp:         NOTRUN -> [FAIL][34] ([Intel XE#1331]) +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_plane@pixel-format@pipe-b.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#1211])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#1201]) +35 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][40] ([Intel XE#616]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#327])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#1447])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1062] / [Intel XE#1201])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#1130] / [Intel XE#1201]) +127 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#1562]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1192] / [Intel XE#1201])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#979])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][53] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - {shard-lnl}:        [FAIL][54] ([Intel XE#1659]) -> [PASS][55] +1 other test pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [DMESG-WARN][56] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - {shard-lnl}:        [FAIL][58] ([Intel XE#1652]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][60] ([Intel XE#1201] / [i915#2575]) -> [PASS][61] +5 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - {shard-lnl}:        [FAIL][62] ([Intel XE#480] / [Intel XE#886]) -> [PASS][63] +3 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][64] ([Intel XE#616]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][66] ([Intel XE#361]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_psr@fbc-psr2-suspend:
    - {shard-lnl}:        [DMESG-WARN][68] ([Intel XE#1830]) -> [PASS][69] +4 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-lnl-8/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][70] ([Intel XE#771] / [Intel XE#899]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][72] ([Intel XE#899]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][74] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [SKIP][76] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-435/igt@kms_vrr@negative-basic.html

  * igt@xe_gt_freq@freq_low_max:
    - {shard-lnl}:        [FAIL][78] ([Intel XE#1045]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-lnl-7/igt@xe_gt_freq@freq_low_max.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-lnl-1/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][80] ([Intel XE#1201]) -> [PASS][81] +4 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_vm@large-userptr-misaligned-binds-2097152:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][83] +14 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@xe_vm@large-userptr-misaligned-binds-2097152.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@xe_vm@large-userptr-misaligned-binds-2097152.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [DMESG-FAIL][84] ([Intel XE#1548]) -> [SKIP][85] ([Intel XE#1201])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][86] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) -> [DMESG-WARN][87] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][88] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][89] ([Intel XE#1033] / [Intel XE#1214]) +1 other test dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201]) -> [SKIP][91] ([Intel XE#1201] / [Intel XE#316])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][93] ([Intel XE#1201]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][94] ([Intel XE#1231]) -> [DMESG-FAIL][95] ([Intel XE#324])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][97] ([Intel XE#1201]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][99] ([Intel XE#1201])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][101] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][103] ([Intel XE#1201]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][105] ([Intel XE#1201])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [i915#2575]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][109] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][111] ([Intel XE#1201] / [i915#2575]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][112] ([Intel XE#1178]) -> [SKIP][113] ([Intel XE#1201] / [i915#2575])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_content_protection@atomic.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][115] ([Intel XE#1201] / [i915#2575])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][117] ([Intel XE#1188])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_content_protection@uevent.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-433/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][119] ([Intel XE#1201] / [i915#2575])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [i915#2575]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#455])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [FAIL][122] ([Intel XE#616]) -> [SKIP][123] ([Intel XE#1201] / [i915#2575])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][125] ([Intel XE#1201] / [i915#2575])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][126] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][127] ([Intel XE#1201] / [i915#2575]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][128] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [SKIP][129] ([Intel XE#1201] / [i915#2575])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][131] ([Intel XE#1214] / [Intel XE#282])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][133] ([Intel XE#1201]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][134] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][135] ([Intel XE#1195] / [Intel XE#927]) +2 other tests incomplete
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][137] ([Intel XE#1201])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@dpms-off-confusion:
    - shard-dg2-set2:     [INCOMPLETE][138] ([Intel XE#1195]) -> [SKIP][139] ([Intel XE#1201] / [i915#2575])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_flip@dpms-off-confusion.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][140] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][141] ([Intel XE#1195] / [Intel XE#927]) +1 other test incomplete
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][142] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][143] ([Intel XE#1195])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [i915#5274]) -> [SKIP][145] ([Intel XE#1201] / [i915#2575])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][147] ([Intel XE#1201]) +29 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][151] ([Intel XE#1201])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][153] ([Intel XE#1201]) +27 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][155] ([Intel XE#1201])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][158] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][159] ([Intel XE#1195]) +1 other test incomplete
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-dg2-set2:     [FAIL][160] ([Intel XE#650]) -> [SKIP][161] ([Intel XE#1201] / [i915#2575])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][162] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][163] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][165] ([Intel XE#1201])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][167] ([Intel XE#1201])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][169] ([Intel XE#1201])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][171] ([Intel XE#1201]) +17 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][173] ([Intel XE#1201] / [i915#2575])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][175] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [i915#2575]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#327])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][178] ([Intel XE#1729]) -> [SKIP][179] ([Intel XE#1201] / [i915#2575])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][180] ([Intel XE#1162] / [Intel XE#1214]) -> [SKIP][181] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][183] ([Intel XE#1201] / [i915#2575]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_vrr@seamless-rr-switch-vrr.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][185] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@sriov_basic@bind-unbind-vf.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@sriov_basic@bind-unbind-vf.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][187] ([Intel XE#1130] / [Intel XE#1201])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][189] ([Intel XE#1130] / [Intel XE#1201])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][190] ([Intel XE#1041]) -> [FAIL][191] ([Intel XE#1600])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][192] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [SKIP][193] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@xe_evict@evict-threads-large.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#1562]) -> [SKIP][195] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#1562])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][199] ([Intel XE#1130] / [Intel XE#1201]) +23 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [INCOMPLETE][202] ([Intel XE#1195]) -> [DMESG-WARN][203] ([Intel XE#1191] / [Intel XE#1214])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][205] ([Intel XE#1130] / [Intel XE#1201])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][207] ([Intel XE#1130] / [Intel XE#1201])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@xe_mmap@small-bar.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_mmap@small-bar.html

  * igt@xe_pm@d3-mmap-system:
    - shard-dg2-set2:     [FAIL][208] ([Intel XE#1221]) -> [SKIP][209] ([Intel XE#1130] / [Intel XE#1201])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@xe_pm@d3-mmap-system.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][211] ([Intel XE#1130] / [Intel XE#1201])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@xe_pm@d3cold-basic.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][212] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][213] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][214] ([Intel XE#1214]) -> [INCOMPLETE][215] ([Intel XE#1195] / [Intel XE#1358])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [INCOMPLETE][216] ([Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][217] ([Intel XE#1214])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][219] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1444
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1562]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1606
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1652
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1664
  [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
  [Intel XE#1699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1733
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1817
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1839
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6 -> xe-pw-133451v1

  IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6: b885b00e7fc01fc109887d59ce2d1283714b07c6
  xe-pw-133451v1: 133451v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/index.html

--===============8311007997916013063==
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
<tr><td><b>Series:</b></td><td>drm/i915/bmg: Load DMC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133451/">https://patchwork.freedesktop.org/series/133451/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6_full -&gt; xe-pw-133451v1_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-133451v1_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133451v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133451v1_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_lease@setcrtc-implicit-plane:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-8/igt@kms_lease@setcrtc-implicit-plane.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-4/igt@kms_lease@setcrtc-implicit-plane.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133451v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-433/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +72 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_plane@pixel-format@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +127 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562">Intel XE#1562</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1652">Intel XE#1652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830">Intel XE#1830</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-lnl-8/igt@kms_psr@fbc-psr2-suspend.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-435/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-lnl-7/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-lnl-1/igt@xe_gt_freq@freq_low_max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-2097152:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@xe_vm@large-userptr-misaligned-binds-2097152.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@xe_vm@large-userptr-misaligned-binds-2097152.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-433/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_flip@dpms-off-confusion.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_flip@dpms-off-confusion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562">Intel XE#1562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562">Intel XE#1562</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-464/igt@xe_pm@d3-mmap-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_pm@d3-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133451v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6 -&gt; xe-pw-133451v1</li>
</ul>
<p>IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1273-b885b00e7fc01fc109887d59ce2d1283714b07c6: b885b00e7fc01fc109887d59ce2d1283714b07c6<br />
  xe-pw-133451v1: 133451v1</p>

</body>
</html>

--===============8311007997916013063==--
