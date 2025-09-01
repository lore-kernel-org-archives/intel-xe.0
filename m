Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79170CA0FFF
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 14:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1751B10E47B;
	Mon,  1 Sep 2025 14:50:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8943710E0AE;
 Mon,  1 Sep 2025 14:50:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1255070401786205665=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/bios=3A_Remove_un?=
 =?utf-8?q?necessary_checks_of_PSR_idle_frames_in_VBT_binary?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Sep 2025 14:50:54 -0000
Message-ID: <175673825455.288971.18371683006901852486@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250901101033.4176277-1-jouni.hogander@intel.com>
In-Reply-To: <20250901101033.4176277-1-jouni.hogander@intel.com>
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

--===============1255070401786205665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/bios: Remove unnecessary checks of PSR idle frames in VBT binary
URL   : https://patchwork.freedesktop.org/series/153793/
State : failure

== Summary ==

CI Bug Log - changes from xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc_FULL -> xe-pw-153793v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-153793v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153793v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153793v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-adlp:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-9/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  
New tests
---------

  New tests have been introduced between xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc_FULL and xe-pw-153793v1_FULL:

### New IGT tests (1) ###

  * igt@xe_oa@tail-address-wrap@rcs-0-128m:
    - Statuses : 1 pass(s)
    - Exec time: [3.17] s

  

Known issues
------------

  Here are the changes found in xe-pw-153793v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [FAIL][3] ([Intel XE#4665])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#4543])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#787]) +69 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][13] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][14] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][16] ([Intel XE#1178])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2341])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2291]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4354])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2316]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][26] -> [DMESG-WARN][27] ([Intel XE#5208])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-4/igt@kms_flip@flip-vs-rmfb.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][28] -> [INCOMPLETE][29] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][30] -> [DMESG-WARN][31] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-bmg:          NOTRUN -> [INCOMPLETE][32] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#2049] / [Intel XE#2597])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][36] -> [DMESG-WARN][37] ([Intel XE#4543]) +5 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-1/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-6/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2293] / [Intel XE#2380])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2293])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2311]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#5390]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#651]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2313]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#1503])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#616])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#870])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1406] / [Intel XE#1489])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#4459]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1499])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4837]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4837])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-435/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-adlp:         [PASS][55] -> [DMESG-FAIL][56] ([Intel XE#3876]) +1 other test dmesg-fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-4/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-9/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#1392]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2322]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#3876])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#4915]) +13 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-435/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4943]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [PASS][64] -> [DMESG-FAIL][65] ([Intel XE#5545])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-4/igt@xe_pm@s3-basic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-9/igt@xe_pm@s3-basic.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4733])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#944])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#944])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][69] ([Intel XE#3862]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][71] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][73] ([Intel XE#2291]) -> [PASS][74] +2 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][75] ([Intel XE#4633]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][77] ([Intel XE#4354]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][79] ([Intel XE#2316]) -> [PASS][80] +2 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-8/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [DMESG-WARN][81] ([Intel XE#4543]) -> [PASS][82] +3 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:
    - shard-dg2-set2:     [INCOMPLETE][83] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][85] -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-435/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#1392]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
    - shard-bmg:          [WARN][89] ([Intel XE#5786]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [DMESG-WARN][91] -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][93] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][94] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][95] ([Intel XE#2705] / [Intel XE#4212]) -> [INCOMPLETE][96] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][97] ([Intel XE#1178]) -> [SKIP][98] ([Intel XE#2341])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_content_protection@legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [DMESG-WARN][99] ([Intel XE#5354]) -> [SKIP][100] ([Intel XE#2291])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][101] ([Intel XE#2312]) -> [SKIP][102] ([Intel XE#2311]) +10 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][103] ([Intel XE#2311]) -> [SKIP][104] ([Intel XE#2312]) +6 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [FAIL][105] ([Intel XE#5671]) -> [DMESG-FAIL][106] ([Intel XE#4543])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][107] ([Intel XE#5390]) -> [SKIP][108] ([Intel XE#2312]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][109] ([Intel XE#2312]) -> [SKIP][110] ([Intel XE#5390]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][111] ([Intel XE#2313]) -> [SKIP][112] ([Intel XE#2312]) +9 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][113] ([Intel XE#2312]) -> [SKIP][114] ([Intel XE#2313]) +12 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][115] ([Intel XE#4596]) -> [SKIP][116] ([Intel XE#5021])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][117] ([Intel XE#1729]) -> [SKIP][118] ([Intel XE#2426])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][119] ([Intel XE#1173]) -> [SKIP][120] ([Intel XE#1061])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-464/igt@xe_peer2peer@write.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5671
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc -> xe-pw-153793v1

  IGT_8519: 8519
  xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc: fb1ad228a10c0201a3fe9d9d18d103d05267cccc
  xe-pw-153793v1: 153793v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/index.html

--===============1255070401786205665==
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
<tr><td><b>Series:</b></td><td>drm/i915/bios: Remove unnecessary checks of =
PSR idle frames in VBT binary</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153793/">https://patchwork.freedesktop.org/series/153793/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153793v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153793v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05=
267cccc_FULL -&gt; xe-pw-153793v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-153793v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-153793v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1537=
93v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@many-userptr-invalidate-race:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-4/igt@xe_exec=
_compute_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-9/igt@x=
e_exec_compute_mode@many-userptr-invalidate-race.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3650-fb1ad228a10c0201a3fe9d9d1=
8d103d05267cccc_FULL and xe-pw-153793v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_oa@tail-address-wrap@rcs-0-128m:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.17] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153793v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@intel_hwmon@hwmon-write.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-a=
dlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/ig=
t@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#=
2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-lnl-1/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-4/igt@kms_fli=
p@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153793v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-2/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +4 other tests dmesg-warn</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-inte=
rruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-in=
terruptible@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-466/igt@kms_fl=
ip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-464/igt@kms_flip@flip-vs-s=
uspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-1/igt@kms_fli=
p@plain-flip-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-6/igt@kms_fli=
p@plain-flip-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +5 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#22=
93</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-3/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-153793v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-466/igt@kms_plane_cursor@viewport@p=
ipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_pm_backlight@basic-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-u=
pdate-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_psr@psr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-lnl-7/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-153793v1/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@xe_eudebug@vma-ufence.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/483=
7">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-435/igt@xe_eudebug_online@interrupt=
-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-4/igt@xe_exec=
_basic@many-execqueues-many-vm-userptr-rebind.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-9/i=
gt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Int=
el XE#3876</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-43=
2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Inte=
l XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-4/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-9/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunma=
p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-435/igt@xe_exec_system_allocator@pr=
ocess-many-execqueues-mmap-remap-dontunmap.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +13=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@xe_exec_system_allocator@thre=
ads-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-4/igt@xe_pm@s=
3-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-153793v1/shard-adlp-9/igt@xe_pm@s3-basic.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel=
 XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-bmg-3/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-=
fw-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-435/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/=
shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-153793v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153793v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-8/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_flip=
@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-8/igt@kms_flip=
@2x-absolute-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-3/igt@kms_fli=
p@flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-adlp-4=
/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +3 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend-interruptible@b-dp4.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel =
XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153793v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-434/igt@kms_hd=
r@static-toggle-suspend@pipe-a-hdmi-a-6.html">INCOMPLETE</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-435/=
igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-466/=
igt@xe_exec_basic@multigpu-no-exec-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-4/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/sh=
ard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-463/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-WARN</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard=
-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">=
PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-153793v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-153793v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-c=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/s=
hard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153793v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5671">Intel XE#5671=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1537=
93v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip=
-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1537=
93v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1537=
93v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1537=
93v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-bmg-6/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc/shard-dg2-464/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153793v1/shard-dg2-432/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc -&gt; xe-pw-153=
793v1</li>
</ul>
<p>IGT_8519: 8519<br />
  xe-3650-fb1ad228a10c0201a3fe9d9d18d103d05267cccc: fb1ad228a10c0201a3fe9d9=
d18d103d05267cccc<br />
  xe-pw-153793v1: 153793v1</p>

</body>
</html>

--===============1255070401786205665==--
