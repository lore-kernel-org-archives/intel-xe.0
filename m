Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216EAC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 17:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D24410F10A;
	Thu, 23 May 2024 17:04:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD42410F10A;
 Thu, 23 May 2024 17:04:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9071080223040472833=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Add_HWMON_support_for_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 May 2024 17:04:47 -0000
Message-ID: <171648388769.2169849.7251441200865650549@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240523144351.4040131-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240523144351.4040131-1-balasubramani.vivekanandan@intel.com>
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

--===============9071080223040472833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add HWMON support for BMG
URL   : https://patchwork.freedesktop.org/series/133970/
State : failure

== Summary ==

CI Bug Log - changes from xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083_full -> xe-pw-133970v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133970v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133970v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133970v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
    - shard-adlp:         [PASS][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_vm@large-split-binds-268435456:
    - shard-dg2-set2:     [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-434/igt@xe_vm@large-split-binds-268435456.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-466/igt@xe_vm@large-split-binds-268435456.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][6] ([Intel XE#1195]) -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [DMESG-WARN][8] ([Intel XE#282]) -> [ABORT][9] +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - {shard-lnl}:        NOTRUN -> [ABORT][10] +1 other test abort
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - {shard-lnl}:        [PASS][11] -> [ABORT][12] +6 other tests abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-8/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@xe_pm@d3cold-mmap-vram:
    - {shard-lnl}:        NOTRUN -> [SKIP][13] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html

  
Known issues
------------

  Here are the changes found in xe-pw-133970v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1125] / [Intel XE#1201])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#316])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][17] ([Intel XE#1231])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#316]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][19] ([Intel XE#1874]) +2 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#607])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#610])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124] / [Intel XE#1201])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#346])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#787]) +59 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +39 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#1252])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@gamma:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#306])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#373])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#373]) +12 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#455]) +17 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#1195]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#308])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][38] ([Intel XE#1214] / [Intel XE#282])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][39] -> [DMESG-WARN][40] ([Intel XE#1214] / [Intel XE#282]) +7 other tests dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#1927])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#702])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#310]) +9 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:
    - shard-dg2-set2:     [PASS][46] -> [INCOMPLETE][47] ([Intel XE#1195])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [ABORT][48] ([Intel XE#1908])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1151] / [Intel XE#1201])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#656]) +43 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#1339])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a:
    - shard-adlp:         NOTRUN -> [FAIL][56] ([Intel XE#1331]) +2 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#616])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][58] ([Intel XE#1162]) +1 other test dmesg-fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#309]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#870])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#870])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#1211])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#836])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1122] / [Intel XE#1201])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#929]) +15 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1127] / [Intel XE#1201])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#327])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][72] ([Intel XE#1195]) +1 other test incomplete
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#1932]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#1447])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][75] -> [TIMEOUT][76] ([Intel XE#1473] / [Intel XE#392])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#261]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_evict@evict-large-cm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#1392]) +8 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#288]) +27 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#512])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][83] ([Intel XE#1214] / [Intel XE#1608])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][84] ([Intel XE#1191] / [Intel XE#1214]) +8 other tests dmesg-warn
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][85] ([Intel XE#1162] / [Intel XE#1214])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][86] -> [ABORT][87] ([Intel XE#1358])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][88] -> [ABORT][89] ([Intel XE#1794])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_pm@s4-mocs.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][90] -> [DMESG-WARN][91] ([Intel XE#1214]) +1 other test dmesg-warn
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][93] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - {shard-lnl}:        [FAIL][95] ([Intel XE#1701]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][97] ([Intel XE#1388]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_color@ctm-0-25@pipe-b:
    - shard-adlp:         [DMESG-WARN][99] ([Intel XE#1214]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-4/igt@kms_color@ctm-0-25@pipe-b.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_color@ctm-0-25@pipe-b.html

  * igt@kms_color@gamma:
    - shard-adlp:         [ABORT][101] ([Intel XE#1908]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@kms_color@gamma.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@kms_color@gamma.html

  * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][103] ([Intel XE#282]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][105] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][106] +2 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - {shard-lnl}:        [ABORT][107] -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_psr@fbc-psr-suspend@edp-1:
    - {shard-lnl}:        [DMESG-WARN][109] ([Intel XE#1830]) -> [PASS][110] +2 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-2/igt@kms_psr@fbc-psr-suspend@edp-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-3/igt@kms_psr@fbc-psr-suspend@edp-1.html

  * igt@kms_sequence@get-busy:
    - shard-adlp:         [ABORT][111] -> [PASS][112] +5 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-8/igt@kms_sequence@get-busy.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_sequence@get-busy.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-dg2-set2:     [ABORT][113] -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-435/igt@xe_evict@evict-beng-small-external-cm.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:
    - shard-adlp:         [FAIL][115] ([Intel XE#1069]) -> [PASS][116] +2 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race:
    - shard-adlp:         [FAIL][117] ([Intel XE#1081]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@twice-rebind:
    - shard-adlp:         [FAIL][119] ([Intel XE#1257]) -> [PASS][120] +2 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_exec_basic@twice-rebind.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_basic@twice-rebind.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate-race:
    - {shard-lnl}:        [DMESG-WARN][121] ([Intel XE#1622]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-1/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-6/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_reset@close-fd:
    - {shard-lnl}:        [DMESG-WARN][123] ([Intel XE#1638]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-6/igt@xe_exec_reset@close-fd.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-7/igt@xe_exec_reset@close-fd.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:
    - shard-adlp:         [FAIL][125] -> [PASS][126] +2 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [TIMEOUT][127] ([Intel XE#1933]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_pm@s3-mocs:
    - shard-adlp:         [INCOMPLETE][129] ([Intel XE#1195]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@xe_pm@s3-mocs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-exec-after:
    - {shard-lnl}:        [ABORT][131] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-3/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][134] ([Intel XE#316])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#316]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][137] ([Intel XE#324]) -> [FAIL][138] ([Intel XE#1231])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][140] ([Intel XE#607])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1124]) -> [SKIP][142] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][144] ([Intel XE#1124]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#607]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#607])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#346]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#346])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#367]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#367])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][152] ([Intel XE#367]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][154] ([Intel XE#787]) +55 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][156] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#787]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [ABORT][161] -> [SKIP][162] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [ABORT][163] -> [SKIP][164] ([Intel XE#1201] / [Intel XE#787])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][166] ([Intel XE#373]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#373]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#307]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#307])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#308]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][174] ([Intel XE#308])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][175] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][176] ([Intel XE#282]) +5 other tests dmesg-warn
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][177] ([Intel XE#282]) -> [DMESG-WARN][178] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][179] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][180] ([Intel XE#1162]) +1 other test dmesg-warn
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][181] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][182] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][183] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][184] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][186] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#455]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][190] ([Intel XE#651]) +14 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-adlp:         [INCOMPLETE][191] ([Intel XE#1195]) -> [ABORT][192] ([Intel XE#1908])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [INCOMPLETE][193] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][194] ([Intel XE#1191] / [Intel XE#1214])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#651]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][198] ([Intel XE#653]) +15 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#653]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][201] ([Intel XE#1162]) -> [DMESG-WARN][202] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][204] ([Intel XE#305]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][206] ([Intel XE#305] / [Intel XE#455]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][208] ([Intel XE#870])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][210] ([Intel XE#908])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         [SKIP][211] ([Intel XE#1201] / [Intel XE#1211]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#836])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1122]) -> [SKIP][214] ([Intel XE#1122] / [Intel XE#1201])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][216] ([Intel XE#929]) +8 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#929]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][220] ([Intel XE#1149])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][222] ([Intel XE#327])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#330]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#330])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][225] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][226] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][227] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][228] ([Intel XE#1034] / [Intel XE#1195])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][230] ([Intel XE#455]) +7 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_vrr@flipline.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1091]) -> [SKIP][232] ([Intel XE#1091] / [Intel XE#1201])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][234] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][236] ([Intel XE#1126])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][237] ([Intel XE#1195] / [Intel XE#1473]) -> [INCOMPLETE][238] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][240] ([Intel XE#288]) +11 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#288]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][244] ([Intel XE#378])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         [FAIL][245] -> [SKIP][246] ([Intel XE#1201])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_pm@d3cold-mmap-vram.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][247] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][248] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-adlp:         [DMESG-WARN][249] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][250] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-8/igt@xe_pm@s3-basic-exec.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [INCOMPLETE][251] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][252] ([Intel XE#1191] / [Intel XE#1214])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [INCOMPLETE][253] ([Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][254] ([Intel XE#1214])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-adlp:         [DMESG-WARN][255] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][256] ([Intel XE#1195] / [Intel XE#1349])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][258] ([Intel XE#944]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#944]) -> [SKIP][260] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-FAIL][261] ([Intel XE#1760]) -> [DMESG-WARN][262] ([Intel XE#1214] / [Intel XE#1760])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1646]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#1927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1927
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
  [Intel XE#1933]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1933
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083 -> xe-pw-133970v1

  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083: 8e768c3e813ab5519a85997b622edc9a2f79c083
  xe-pw-133970v1: 133970v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/index.html

--===============9071080223040472833==
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
<tr><td><b>Series:</b></td><td>Add HWMON support for BMG</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133970/">https://patchwork.freedesktop.org/series/133970/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083_full -&gt; xe-pw-133970v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133970v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133970v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133970v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-268435456:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-434/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-466/igt@xe_vm@large-split-binds-268435456.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-4.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-bottom.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-8/igt@kms_psr@psr2-cursor-blt@edp-1.html">ABORT</a> +6 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133970v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1927">Intel XE#1927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@kms_vblank@wait-forked-busy-hang.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-2/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388">Intel XE#1388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-4/igt@kms_color@ctm-0-25@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_color@ctm-0-25@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@kms_color@gamma.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@kms_color@gamma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend@edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-2/igt@kms_psr@fbc-psr-suspend@edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830">Intel XE#1830</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-3/igt@kms_psr@fbc-psr-suspend@edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-8/igt@kms_sequence@get-busy.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@kms_sequence@get-busy.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-435/igt@xe_evict@evict-beng-small-external-cm.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@xe_evict@evict-beng-small-external-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_exec_basic@twice-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257">Intel XE#1257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_basic@twice-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-1/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622">Intel XE#1622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-6/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-6/igt@xe_exec_reset@close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-7/igt@xe_exec_reset@close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1933">Intel XE#1933</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@xe_pm@s3-mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-2/igt@xe_pm@d3cold-mmap-vram.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-6/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-8/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349">Intel XE#1349</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133970v1/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083 -&gt; xe-pw-133970v1</li>
</ul>
<p>IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1334-8e768c3e813ab5519a85997b622edc9a2f79c083: 8e768c3e813ab5519a85997b622edc9a2f79c083<br />
  xe-pw-133970v1: 133970v1</p>

</body>
</html>

--===============9071080223040472833==--
