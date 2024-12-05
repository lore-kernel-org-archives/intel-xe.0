Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81277E77171
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 22:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FAC10E3D4;
	Thu,  5 Dec 2024 22:40:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C928B10E3D4;
 Thu,  5 Dec 2024 22:40:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7604671128524294291=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/vsec=3A_Address_sta?=
 =?utf-8?q?tic_checker_issue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 22:40:08 -0000
Message-ID: <173343840880.3118593.410668552113996206@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205183649.3120032-1-michael.j.ruhl@intel.com>
In-Reply-To: <20241205183649.3120032-1-michael.j.ruhl@intel.com>
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

--===============7604671128524294291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vsec: Address static checker issue
URL   : https://patchwork.freedesktop.org/series/142197/
State : failure

== Summary ==

CI Bug Log - changes from xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce_full -> xe-pw-142197v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142197v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142197v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142197v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@wf_vblank-ts-check@c-dp2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check@c-dp2.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-x:
    - shard-bmg:          NOTRUN -> [SKIP][2] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-x.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-67108864:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +14 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][7] ([Intel XE#3468]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [DMESG-FAIL][9] ([Intel XE#3468]) -> [DMESG-FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][11] ([Intel XE#2313]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01:
    - shard-bmg:          [DMESG-WARN][13] ([Intel XE#3468]) -> [DMESG-WARN][14] +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html

  
Known issues
------------

  Here are the changes found in xe-pw-142197v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][15] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#827]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][18] ([Intel XE#1033] / [Intel XE#1727]) +2 other tests dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][19] ([Intel XE#1727] / [Intel XE#3468])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-3.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#1701]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#316]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][23] -> [FAIL][24] ([Intel XE#1231])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#2191])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#787]) +14 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2325])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#306])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#373]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2252]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][35] ([Intel XE#2715] / [Intel XE#3468])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2320]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][38] ([Intel XE#3468])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#309])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][42] -> [DMESG-WARN][43] ([Intel XE#1727]) +1 other test dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#776])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1135])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#310]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2316]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2316])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:
    - shard-bmg:          [PASS][50] -> [FAIL][51] ([Intel XE#2882]) +2 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#3684])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#886]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][56] -> [INCOMPLETE][57] ([Intel XE#2635])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-linear:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][58] ([Intel XE#1727] / [Intel XE#3468])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-linear.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#2333]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#656]) +10 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#651]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2311]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2312]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1158])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#653]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [PASS][66] -> [DMESG-WARN][67] ([Intel XE#3468]) +25 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-bmg:          [PASS][68] -> [DMESG-FAIL][69] ([Intel XE#2705] / [Intel XE#3468])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_plane_lowres@tiling-none.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#2763]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#1430]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes@plane-50:
    - shard-bmg:          [PASS][74] -> [DMESG-WARN][75] ([Intel XE#1727] / [Intel XE#3468]) +6 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_pm_rpm@legacy-planes@plane-50.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_pm_rpm@legacy-planes@plane-50.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-lnl:          [PASS][76] -> [DMESG-WARN][77] ([Intel XE#3184]) +1 other test dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1489]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2234] / [Intel XE#2850])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][81] ([Intel XE#1874])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-bmg:          [PASS][82] -> [DMESG-FAIL][83] ([Intel XE#3468]) +1 other test dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-180.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#3414])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#1435])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@query-idle@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][87] ([Intel XE#3468]) +18 other tests dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2168])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#2168])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#756])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#1091] / [Intel XE#2849])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1126])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2905]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#2905]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][95] ([Intel XE#1473])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_basic@many-basic-defer-bind:
    - shard-bmg:          [PASS][97] -> [DMESG-WARN][98] ([Intel XE#2705] / [Intel XE#3468])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_exec_basic@many-basic-defer-bind.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_exec_basic@many-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2322]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1392]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#288]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-adlp:         [PASS][102] -> [DMESG-WARN][103] ([Intel XE#3086] / [Intel XE#3343])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128]) -> ([PASS][129], [PASS][130], [PASS][131], [SKIP][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154]) ([Intel XE#2457])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-7/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-7/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][155] -> [DMESG-WARN][156] ([Intel XE#3467])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_module_load@reload.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_module_load@reload.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#3573])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#2838] / [Intel XE#979])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][159] -> [DMESG-WARN][160] ([Intel XE#3468] / [Intel XE#569])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][161] -> [ABORT][162] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#944])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@legacy-format:
    - shard-bmg:          [DMESG-WARN][164] ([Intel XE#2705]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_addfb_basic@legacy-format.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [DMESG-FAIL][166] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][168] ([Intel XE#324]) -> [PASS][169] +3 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][170] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [DMESG-FAIL][172] ([Intel XE#3468]) -> [PASS][173] +2 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1:
    - shard-lnl:          [FAIL][174] ([Intel XE#2577]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][176] ([Intel XE#2291]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          [INCOMPLETE][178] ([Intel XE#3468]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          [DMESG-FAIL][180] ([Intel XE#2705]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][182] ([Intel XE#2373]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][184] ([Intel XE#2316]) -> [PASS][185] +7 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [FAIL][186] ([Intel XE#3036]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-3/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - shard-lnl:          [FAIL][188] -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-3/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [FAIL][190] ([Intel XE#2882]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_flip@plain-flip-ts-check.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][192] ([Intel XE#1503]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_hdr@static-toggle-dpms.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][194] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-bmg:          [DMESG-WARN][196] ([Intel XE#2566]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_rpm@legacy-planes@plane-41:
    - shard-adlp:         [DMESG-WARN][198] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-2/igt@kms_pm_rpm@legacy-planes@plane-41.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-1/igt@kms_pm_rpm@legacy-planes@plane-41.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][200] ([Intel XE#2883]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][202] ([Intel XE#899]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][204] -> [PASS][205] +12 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_reset@virtual-close-execqueues-close-fd:
    - shard-bmg:          [DMESG-WARN][206] ([Intel XE#1727]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - shard-bmg:          [DMESG-WARN][208] ([Intel XE#3468]) -> [PASS][209] +27 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-adlp:         [DMESG-WARN][210] ([Intel XE#3086]) -> [PASS][211] +2 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][212] ([Intel XE#1794]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][214] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_pm@s4-vm-bind-userptr.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][216] ([Intel XE#958]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
    - shard-lnl:          [FAIL][218] ([Intel XE#958]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-bmg:          [DMESG-WARN][220] ([Intel XE#2705] / [Intel XE#3468]) -> [DMESG-WARN][221] ([Intel XE#3468])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [DMESG-WARN][222] ([Intel XE#2705] / [Intel XE#3468]) -> [DMESG-FAIL][223] ([Intel XE#2705] / [Intel XE#3468])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][224] -> [FAIL][225] ([Intel XE#1231])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][226] ([Intel XE#324]) -> [FAIL][227] ([Intel XE#1231] / [Intel XE#3052])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [DMESG-FAIL][228] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-FAIL][229] ([Intel XE#3468]) +1 other test dmesg-fail
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_color@deep-color.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][230] ([Intel XE#2341]) -> [INCOMPLETE][231] ([Intel XE#2715] / [Intel XE#3468])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_content_protection@atomic.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][232] ([Intel XE#2341]) -> [FAIL][233] ([Intel XE#1178])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_edge_walk@256x256-left-edge:
    - shard-bmg:          [DMESG-WARN][234] ([Intel XE#3468]) -> [DMESG-FAIL][235] ([Intel XE#3468]) +2 other tests dmesg-fail
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_cursor_edge_walk@256x256-left-edge.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-left-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [DMESG-WARN][236] ([Intel XE#3468]) -> [SKIP][237] ([Intel XE#2291])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][238] ([Intel XE#2291]) -> [DMESG-WARN][239] ([Intel XE#3468])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][240] ([Intel XE#3009]) -> [DMESG-WARN][241] ([Intel XE#3468])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_dp_aux_dev.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [DMESG-WARN][242] ([Intel XE#3468]) -> [SKIP][243] ([Intel XE#2316]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][244] ([Intel XE#2882]) -> [SKIP][245] ([Intel XE#2316])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][246] ([Intel XE#1727] / [Intel XE#3468]) -> [ABORT][247] ([Intel XE#3468])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [FAIL][248] ([Intel XE#2882]) -> [DMESG-FAIL][249] ([Intel XE#3468]) +1 other test dmesg-fail
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2:
    - shard-bmg:          [FAIL][250] ([Intel XE#2882]) -> [DMESG-WARN][251] ([Intel XE#3468])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [DMESG-FAIL][252] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) -> [SKIP][253] ([Intel XE#3665])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][254] ([Intel XE#2311]) -> [SKIP][255] ([Intel XE#2312]) +14 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [INCOMPLETE][256] ([Intel XE#1727] / [Intel XE#2050]) -> [FAIL][257] ([Intel XE#2333])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][258] ([Intel XE#2312]) -> [FAIL][259] ([Intel XE#2333]) +3 other tests fail
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [FAIL][260] ([Intel XE#2333]) -> [SKIP][261] ([Intel XE#2312])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][262] ([Intel XE#2312]) -> [DMESG-FAIL][263] ([Intel XE#3468]) +1 other test dmesg-fail
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][264] ([Intel XE#3468]) -> [SKIP][265] ([Intel XE#2312]) +4 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-bmg:          [DMESG-FAIL][266] ([Intel XE#3468]) -> [FAIL][267] ([Intel XE#2333])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][268] ([Intel XE#2312]) -> [SKIP][269] ([Intel XE#2311]) +15 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][270] ([Intel XE#2313]) -> [SKIP][271] ([Intel XE#2312]) +10 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][272] ([Intel XE#2312]) -> [SKIP][273] ([Intel XE#2313]) +14 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_properties@connector-properties-atomic:
    - shard-bmg:          [DMESG-WARN][274] -> [DMESG-WARN][275] ([Intel XE#3468])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@kms_properties@connector-properties-atomic.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-7/igt@kms_properties@connector-properties-atomic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][276] ([Intel XE#2509]) -> [SKIP][277] ([Intel XE#2426])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@query-forked-busy-hang:
    - shard-bmg:          [DMESG-FAIL][278] ([Intel XE#3468]) -> [DMESG-WARN][279] ([Intel XE#3468]) +6 other tests dmesg-warn
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_vblank@query-forked-busy-hang.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_vblank@query-forked-busy-hang.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-bmg:          [DMESG-FAIL][280] ([Intel XE#3468]) -> [DMESG-FAIL][281] ([Intel XE#1727] / [Intel XE#3468])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-2:
    - shard-bmg:          [DMESG-WARN][282] ([Intel XE#3468]) -> [DMESG-WARN][283] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-2.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-2.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [TIMEOUT][284] ([Intel XE#1473]) -> [INCOMPLETE][285] ([Intel XE#1473] / [Intel XE#3468])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [FAIL][286] ([Intel XE#1000]) -> [TIMEOUT][287] ([Intel XE#1473])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [DMESG-FAIL][288] -> [TIMEOUT][289] ([Intel XE#1473] / [Intel XE#2472])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [TIMEOUT][290] ([Intel XE#1473] / [Intel XE#2472]) -> [FAIL][291] ([Intel XE#1000])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_evict@evict-threads-large.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@xe_evict@evict-threads-large.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][292] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][293] ([Intel XE#3343]) +1 other test dmesg-warn
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          [DMESG-WARN][294] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][295] ([Intel XE#3468])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-WARN][296] ([Intel XE#3467]) -> [DMESG-WARN][297] ([Intel XE#3467] / [Intel XE#3468]) +3 other tests dmesg-warn
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-bmg:          [DMESG-WARN][298] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][299] ([Intel XE#3468])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@xe_pm@d3hot-mmap-system.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [DMESG-WARN][300] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [DMESG-WARN][301] ([Intel XE#3468] / [Intel XE#569])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@xe_pm@s3-basic-exec.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_pm@s3-basic-exec.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][302] ([Intel XE#2919] / [Intel XE#3468]) -> [DMESG-WARN][303] ([Intel XE#2919])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_wedged@basic-wedged.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][304] ([Intel XE#3468]) -> [DMESG-WARN][305] ([Intel XE#3467])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#3036]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3665
  [Intel XE#3684]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3684
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce -> xe-pw-142197v1

  IGT_8138: 8138
  xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce: ab26b8eb1a5191f86d7b778e71a15d34fb4737ce
  xe-pw-142197v1: 142197v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/index.html

--===============7604671128524294291==
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
<tr><td><b>Series:</b></td><td>drm/xe/vsec: Address static checker issue</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142197/">https://patchwork.freedesktop.org/series/142197/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142197v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142197v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2327-ab26b8eb1a5191f86d7b778e71a15d34f=
b4737ce_full -&gt; xe-pw-142197v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142197v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142197v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1421=
97v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check@c=
-dp2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@kms_flip_tiling@flip-change-t=
iling@pipe-a-dp-2-linear-to-x.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_pipe=
_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_p=
ipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-67108864:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_vm@la=
rge-userptr-split-misaligned-binds-67108864.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@x=
e_vm@large-userptr-split-misaligned-binds-67108864.html">DMESG-WARN</a> +14=
 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_big_=
fb@4-tiled-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/ig=
t@kms_big_fb@4-tiled-8bpp-rotate-0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">DMESG-FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msf=
lip-blt.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1=
/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.ht=
ml">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-v=
ram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_ccs@b=
lock-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed@til=
e64-uncompressed-compfmt0-vram01-vram01.html">DMESG-WARN</a> +1 other test =
dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142197v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_async_flips@alternate-sy=
nc-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)<=
/li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_async_f=
lips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_async_flips@alternate-sy=
nc-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-3:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_atomic_interruptible@univ=
ersal-setplane-primary@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outp=
uts:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-4/igt@kms_atom=
ic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197=
v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fen=
cing@1x-outputs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_big_fb@x-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-a=
dlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_bw@connected-linear-tili=
ng-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-til=
ed-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-ti=
led-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_chamelium_color@ctm-nega=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-s=
tress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fas=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscree=
n-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-=
movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-=
left-edge@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs=
-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_cursor_=
legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_dith=
er@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_=
dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vbla=
nk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip=
@basic-flip-vs-wf_vblank@b-dp2.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@kms_flip@basic=
-flip-vs-wf_vblank@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/i=
gt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3684">Intel =
XE#3684</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-5/igt@kms_flip=
@plain-flip-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-5/igt@kms_flip@plain-fl=
ip-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_flip=
@wf_vblank-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_flip@wf_vblank-ts-che=
ck.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@kms_flip_tiling@flip-change-t=
iling@pipe-a-dp-2-linear-to-linear.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3=
468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
1p-offscren-pri-indfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other tes=
t fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_pipe=
_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@kms_pipe_crc_basic=
@nonblocking-crc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +25 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_plan=
e_lowres@tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_plane_lowres@tiling-=
none.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-3/igt@kms_pm_d=
c@dc6-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142197v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel X=
E#1430</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_pm_r=
pm@legacy-planes@plane-50.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_pm_rpm@legacy-p=
lanes@plane-50.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-7/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-8/igt@kms_pm_rpm@modeset-lps=
p-stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_psr2_sf@psr2-primary-pla=
ne-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_psr@fbc-pr-sprite-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-plane=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-=
rotation-cropping-bottom.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_rota=
tion_crc@primary-rotation-180.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_rotation_cr=
c@primary-rotation-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dme=
sg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_vblank@query-idle@pipe-a-=
hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>) +18 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear=
-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_eudebug@discovery-empty-cl=
ients.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_eudebug_online@single-ste=
p-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-man=
y-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_evict@evict-beng-threads-=
large.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_exec_=
basic@many-basic-defer-bind.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_exec_basic@man=
y-basic-defer-bind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-ex=
ec-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_exec_fault_mode@once-bind=
execqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-4/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-=
adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3086">Intel XE#3086</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb47=
37ce/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34=
fb4737ce/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a1=
5d34fb4737ce/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e=
71a15d34fb4737ce/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b=
778e71a15d34fb4737ce/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f8=
6d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a51=
91f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb=
1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26=
b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-=
ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-=
bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142197v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142197v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142197v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_modul=
e_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_module_load@reload.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_oa@non-privileged-access-=
vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_pat@pat-index-xehpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_pm@s3=
-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-4/igt@xe_pm@s=
4-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142197v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">=
Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_query@multigpu-query-uc-f=
w-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_addf=
b_basic@legacy-format.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms=
_addfb_basic@legacy-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-3/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142197v1/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-a=
tomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-1/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">=
Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142197v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip=
-events@pipe-b-hdmi-a-1-y.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142197v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/s=
hard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-5/igt@kms_curs=
or_edge_walk@256x256-left-edge@pipe-a-edp-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/sha=
rd-lnl-5/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_draw=
_crc@draw-method-blt@rgb565-4tiled.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-=
bmg-5/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_draw=
_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shar=
d-bmg-5/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_flip=
@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3036">Intel XE#3036</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-3/igt@kms_fl=
ip@basic-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_flip=
@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-3/igt@kms_flip@basi=
c-flip-vs-wf_vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_flip=
@plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/igt@kms_flip@p=
lain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/igt@kms_hdr@stat=
ic-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_plan=
e_alpha_blend@alpha-7efc@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE=
#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142197v1/shard-bmg-8/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">I=
ntel XE#2566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142197v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-=
0-5-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-41:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-2/igt@kms_pm_=
rpm@legacy-planes@plane-41.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/=
shard-adlp-1/igt@kms_pm_rpm@legacy-planes@plane-41.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-7/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-4/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl=
-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_exec_=
basic@many-execqueues-many-vm-userptr-rebind.html">DMESG-WARN</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-=
4/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">PASS</a> +=
12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-execqueues-close-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_exec_=
reset@virtual-close-execqueues-close-fd.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/s=
hard-bmg-5/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_exec_=
threads@threads-fd-userptr-invalidate-race.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v=
1/shard-bmg-8/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">=
PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel=
 XE#3086</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142197v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_sriov_init.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-8/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_pm@s4=
-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-8/igt@xe_pm_r=
esidency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-adlp-6/igt@xe_pm_resi=
dency@toggle-gt-c6.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-4/igt@xe_pm_re=
sidency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-lnl-4/igt@xe_pm_reside=
ncy@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_atom=
ic_transition@plane-all-transition-fencing.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">In=
tel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142197v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-=
fencing.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142197v1/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-r=
otate-0-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hfl=
ip-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE=
#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142197v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-a=
sync-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1231">Intel XE#1231</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_colo=
r@deep-color.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/ig=
t@kms_color@deep-color.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dme=
sg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_conte=
nt_protection@atomic.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-3/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_curs=
or_edge_walk@256x256-left-edge.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-=
4/igt@kms_cursor_edge_walk@256x256-left-edge.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-b=
mg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-8/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@kms_dp_aux_dev.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_flip=
@2x-blocking-wf_vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@km=
s_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3=
468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42197v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346=
8">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_flip=
@flip-vs-absolute-wf_vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/i=
gt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_flip=
@flip-vs-absolute-wf_vblank@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/i=
gt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip=
_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"=
>Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142197v1/shard-bmg-2/igt@kms_flip_tiling@flip-chang=
e-tiling@pipe-a-dp-2-x-to-x.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3665">Intel XE#3665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#17=
27</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/205=
0">Intel XE#2050</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-cur-indfb-move.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-=
blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-dra=
w-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Int=
el XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-modesetfrombusy.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shar=
d-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE=
#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142197v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pr=
i-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
197v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
97v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@kms_prop=
erties@connector-properties-atomic.html">DMESG-WARN</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-7/igt@kms_=
properties@connector-properties-atomic.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/sha=
rd-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_vbla=
nk@query-forked-busy-hang.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/ig=
t@kms_vblank@query-forked-busy-hang.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_vbla=
nk@ts-continuation-dpms-rpm.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/i=
gt@kms_vblank@ts-continuation-dpms-rpm.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_vbla=
nk@ts-continuation-dpms-rpm@pipe-d-dp-2.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/s=
hard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-dp-2.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_evict=
@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-4/=
igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@xe_evict=
@evict-beng-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_ev=
ict@evict-beng-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_evict=
@evict-mixed-threads-large.html">DMESG-FAIL</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_evict@evi=
ct-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_evict=
@evict-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg=
-3/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel=
 XE#3343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-=
probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +1 other t=
est dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_fault=
_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel =
XE#3467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142197v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-p=
robe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3=
467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42197v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_pr=
epare.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@xe_pm@d3=
hot-mmap-system.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5=
/igt@xe_pm@d3hot-mmap-system.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@xe_pm@s3=
-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/sha=
rd-bmg-5/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_wedge=
d@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-1/=
igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_wedge=
d@wedged-mode-toggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142197v1/shard-bmg-5/igt@xe_w=
edged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce -&gt; xe-pw-142=
197v1</li>
</ul>
<p>IGT_8138: 8138<br />
  xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce: ab26b8eb1a5191f86d7b778=
e71a15d34fb4737ce<br />
  xe-pw-142197v1: 142197v1</p>

</body>
</html>

--===============7604671128524294291==--
